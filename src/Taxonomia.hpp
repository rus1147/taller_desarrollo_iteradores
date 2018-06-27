#include <sstream>

// Métodos de Taxonomia (ya implementados por la cátedra):

template<class T>
int Taxonomia<T>::_espiarProximoCaracter(istream& is) const {
	int c = is.peek();
	while (c == ' ' || c == '\t' || c == '\r' || c == '\n') {
		is.get();
		c = is.peek();
	}
	return is.peek();
}

template<class T>
typename Taxonomia<T>::Nodo* Taxonomia<T>::_leerDe(istream& is) {
	Taxonomia<T>::Nodo* nodo = new Taxonomia<T>::Nodo();
	is >> nodo->valor;
	if (_espiarProximoCaracter(is) == '{') {
		is.get();
		while (_espiarProximoCaracter(is) != '}') {
			nodo->hijos.push_back(_leerDe(is));
		}
		is.get();
	}
	return nodo;
}

template<class T>
Taxonomia<T>::Taxonomia(const string& input) {
	istringstream is(input);
	_raiz = _leerDe(is);
}

template<class T>
void Taxonomia<T>::_borrar(Taxonomia<T>::Nodo* nodo) {
	for (int i = 0; i < nodo->hijos.size(); i++) {
		_borrar(nodo->hijos[i]);
	}
	delete nodo;
}

template<class T>
Taxonomia<T>::~Taxonomia() {
	_borrar(_raiz);
}

template<class T>
void Taxonomia<T>::_identar(ostream& os, int tab) const {
	for (int i = 0; i < tab; i++) {
		os << "  ";
	}
}

template<class T>
void Taxonomia<T>::_mostrarEn(
		ostream& os, Taxonomia<T>::Nodo* nodo, int tab) const {
	_identar(os, tab);
	os << nodo->valor;
	if (nodo->hijos.size() == 0) {
		os << "\n";
	} else {
		os << " {\n";
		for (int i = 0; i < nodo->hijos.size(); i++) {
			_mostrarEn(os, nodo->hijos[i], tab + 1);
		}
		_identar(os, tab);
		os << "}\n";
	}
}

template<class T>
void Taxonomia<T>::mostrar(ostream& os) const {
	_mostrarEn(os, _raiz, 0);
}

////////////////////////////////////////

// Métodos para implementar el iterador de Taxonomia<T> (para completar)

// Devuelve un iterador válido al principio de la taxonomía.
template<class T>
typename Taxonomia<T>::iterator Taxonomia<T>::begin() {
    return iterator(_raiz);
}

// Devuelve un iterador válido al final de la taxonomía.
template<class T>
typename Taxonomia<T>::iterator Taxonomia<T>::end() {
    iterator it=iterator(_raiz);
    //ubico el it al final de la taxonomia, recorro por el ultimo elem del vector
    while(it.actual->hijos.size() > 0){
        //Si hay hijos agarro el último insertado
        //Guardo el padre y la pos en el array de hijos para poder recorrer con --
        it.padres.emplace(it.actual, it.actual->hijos.size() - 1);
        //Cambio el nodo por el siguiente
        it.actual = it.actual->hijos.back(); // .back() es el último insertado, deberia dar lo mismo que arriba
    }
    return it;
}

// Constructor por defecto del iterador.
// (Nota: puede construir un iterador inválido).
template<class T>
Taxonomia<T>::iterator::iterator():actual(nullptr), padres(){}

template<class T>
Taxonomia<T>::iterator::iterator(Taxonomia<T>::Nodo *elem) {
    //Donde empieza a recorrer
    actual = elem;
}
// Referencia mutable al nombre de la categoría actual.
// Pre: el iterador está posicionado sobre una categoría.
template<class T>
T& Taxonomia<T>::iterator::operator*() const {
    return actual->valor;
}

// Cantidad de subcategorías de la categoría actual.
// Pre: el iterador está posicionado sobre una categoría.
template<class T>
int Taxonomia<T>::iterator::cantSubcategorias() const {
    return  actual->hijos.size();
}

// Ubica el iterador sobre la i-ésima subcategoría.
// Pre: el iterador está posicionado sobre una categoría
// y además 0 <= i < cantSubcategorias().
template<class T>
void Taxonomia<T>::iterator::subcategoria(int i) {
	padres.push(make_pair(actual,i));
    actual=actual->hijos[i];
}

// Devuelve true sii la categoría actual es la raíz. 
// Pre: el iterador está posicionado sobre una categoría.
template<class T>
bool Taxonomia<T>::iterator::esRaiz() const {
    return padres.size()==0;
}

// Ubica el iterador sobre la supercategoría de la categoría
// actual.
// Pre: el iterador está posicionado sobre una categoría
// y además !esRaiz()
template<class T>
void Taxonomia<T>::iterator::supercategoria() {
    //sa supercat es el pmr padre de la pila
    actual=padres.top().first;
    padres.pop();
}

// Compara dos iteradores por igualdad.
// Pre: deben ser dos iteradores de la misma taxonomía.
template<class T>
bool Taxonomia<T>::iterator::operator==(
		const Taxonomia<T>::iterator& otro) const {
    return actual==otro.actual;
}

// Ubica el iterador sobre la categoría siguiente a la actual
// en el recorrido *preorder* de la taxonomía.
// Si se trata de la última categoría de la taxonomía,
// el iterador resultante debe ser igual al iterador end()
// de la taxonomía.
template<class T>
void Taxonomia<T>::iterator::operator++() {
    //Me fijo si el nodo actual tiene hijos
    //  Si tiene:
    //      Si no recorri todos los hijos: Voy al siguiente hijo
    //      Si recorri todos: Vuelvo al padre
    //  Si no tiene hijos: Vuelvo al padre
	stack<pair<Nodo*,int>> copiaPila(padres);
    bool final= true;
    if(actual->hijos.size()!=0){
        final=false;
    }
    while(!copiaPila.empty()){
        if(copiaPila.top().second != copiaPila.top().first->hijos.size()-1){
            final=false;
            break;
        }
        copiaPila.pop();
    }
    if(final)
        return;
    if(actual->hijos.size()!=0){
        //Si el nodo tiene hijos por recorrer, avanzo al sig
        //Para ver por que hijo se recorrió, me fijo en el stack de padres
        //No borro un padre hasta  que no recori el stack
        //Si no se entro a este padre
        if(padres.empty() || padres.top().first!=actual){
            //agrego el nodo a la pila
            padres.emplace(actual,0);
            //el actual es el primer hijo
            actual=actual->hijos[0];
        }
    } else{
        //el nodo no tiene hijos, vuelvo al padre
        actual=padres.top().first;
        //volvi a un hijo
        if(padres.top().second +1 <actual->hijos.size()){
            actual=actual->hijos[padres.top().second+1];
            padres.top().second= padres.top().second+1;
        } else{
            //ya no tengo hijos, avanzo a otro padre
            padres.pop();
            //subo al padre y verifico que pueda recorrer a los hijos
            while(padres.top().second+1 >= padres.top().first->hijos.size()){
                padres.pop();
            }
            //sacando los padres que no me sirven
            padres.top().second= padres.top().second+1;
            actual=padres.top().first->hijos[padres.top().second];
        }
    }
    
}

// Ubica el iterador sobre la categoría anterior a la actual
// en el recorrido *preorder* de la taxonomía.
// Si se trata de la raíz de la taxonomía el iterador
// resultante debe ser igual al iterador end() de la taxonomía.
// Pre: el iterador está posicionado sobre una categoría.
template<class T>
void Taxonomia<T>::iterator::operator--() {
    if(padres.empty()){
        //voy hasta el ultimoo
        while(actual->hijos.size() > 0){
            padres.emplace(actual, actual->hijos.size() - 1);
            actual = actual->hijos.back();
        }
    } else{ //no es la raiz
            if(padres.top().second==0){
                actual= padres.top().first;
                padres.pop();
            } else{
                padres.top().second=padres.top().second-1;
                actual=padres.top().first->hijos[padres.top().second];
                while (actual->hijos.size()>0){
                    padres.emplace(actual,actual->hijos.size()-1);
                    actual=actual->hijos.back();
                }
            }
    }
}

// Inserta una subcategoría con el nombre indicado
// en el lugar i-ésimo.
// Observación: esta operación modifica la taxonomía y
// puede invalidar otros iteradores.
// Pre: el iterador está posicionado sobre una categoría,
// y además 0 <= i <= cantSubcategorias().
template<class T>
void Taxonomia<T>::iterator::insertarSubcategoria(int i, const T& nombre) {
    Nodo* nuevaCategoria= new Taxonomia<T>::Nodo();
    nuevaCategoria->valor=nombre;
    actual->hijos.push_back(nuevaCategoria);
    
    for(int j=actual->hijos.size()-1;i<j;j--){
        swap(actual->hijos[j],actual->hijos[j-1]);
    }
}

// Elimina la categoría actual de la taxonomía
// (y todas sus subcategorías).
// Observación: esta operación modifica la taxonomía y
// puede invalidar otros iteradores. Debe encargarse de
// liberar la memoria.
// Pre: el iterador está posicionado sobre una categoría,
// y además !esRaiz().
template<class T>
void Taxonomia<T>::iterator::eliminarCategoria() {
	Taxonomia<T>::iterator itHijos(actual);
    for(int i=0; itHijos.actual->hijos.size();i++){
        itHijos.subcategoria(0);
        itHijos.eliminarCategoria();
    }
    delete actual;
    actual= padres.top().first;
    
    int indiceHijoBorrado= padres.top().second;
    padres.pop();
    
    for(int i=indiceHijoBorrado;i<actual->hijos.size()-1;i++){
        swap(actual->hijos[i],actual->hijos[i+1]);
    }
    //ajusto el tamaño
    actual->hijos.resize(actual->hijos.size()-1);
}

