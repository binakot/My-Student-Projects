//queue.h
#ifndef QUEUE_H
#define QUEUE_H

#include <stdlib.h>

/******************************************************************************/
template <class T> class queue {
protected:
        int size;
public:
        virtual void Insert(T TData, int Prioriry) = 0;
        virtual T Pop() = 0;
        virtual T Top() = 0;
        int GetSize() { return size; }
};
/******************************************************************************/
template <class T> struct queue_element {
        int priority;
	T data;
};

template <class T> struct list_element {
        queue_element<T> qData;
        list_element<T> *next;
};

//очередь на основе списка
template <class T> class queue_list: public queue<T> {
	list_element<T> *head_of_queue;
	list_element<T> *tail_of_queue;
public:
	queue_list();
        ~queue_list();
        void Clear();
	void Insert(T TData, int Priority);
        T Pop();
        T Top();
        bool IsEmpty() { return !head_of_queue; }
};

//очередь на основе массива
template <class T> class queue_array: public queue<T> {
	queue_element<T>* array;
        int part;
        int current;
        bool sorting;
        void Sort();
public:
	queue_array();
        queue_array(int part_size);
        ~queue_array();
	void Insert(T TData, int Priority);
        T Pop();
        T Top();
        bool IsFull();
        void Resize();
        void Resize(int nSize);
        bool IsEmpty() { return (size > 0)?false:true; }
        int (*sort_function)(const void *a, const void *b);
};

/******************************************************************************/

template <class T> queue_list<T>::queue_list() {
	head_of_queue = tail_of_queue = NULL;
        size = 0;
}

template <class T> queue_list<T>::~queue_list() {
        Clear();
}

template <class T> void queue_list<T>::Clear() {
        list_element<T> *p1, *p2;

        if (head_of_queue)
        {
                p2 = tail_of_queue;
                do
	        {
                        p1 = p2;
                        p2 = p2->next;
                        delete p1;
        	}
                while (p2 != head_of_queue && p2 != NULL);
                delete p2;
        }
        head_of_queue = NULL;
        tail_of_queue = NULL;
        size = 0;
}

template <class T> void queue_list<T>::Insert(T TData, int Priority) {
	list_element<T> *p, *p2;

	p = new list_element<T>;
	if (!p)
		throw "Невозможно добавить элемент. Возможно не хватает памяти.";

	p->qData.data = TData;
        p->qData.priority = Priority;

	if (head_of_queue) {
                if (Priority > tail_of_queue->qData.priority) {
                        p->next = tail_of_queue;
                        tail_of_queue = p;
                }
                else {
                        p2 = tail_of_queue;
                        while (p2->next != NULL && p2->next->qData.priority >= Priority)
                                p2 = p2->next;

                        if (p2 != head_of_queue) {
                                p->next = p2->next;
                                p2->next = p;
                        }
                        else {
                                head_of_queue = p;
                                p2->next = p;
                                p->next = NULL;
                        }
                }
        }
	else {
	        head_of_queue = p;
                tail_of_queue = p;
                head_of_queue->next = NULL;
        }
        size++;
}

template <class T> T queue_list<T>::Pop() {
	list_element<T> *p;
        T ret;

	if (!head_of_queue)
	        throw "Очередь пуста.";

        ret = tail_of_queue->qData.data;
	p = tail_of_queue;
        tail_of_queue = tail_of_queue->next;
        if (!tail_of_queue)
                head_of_queue = NULL;
        delete p;
        size--;

        return ret;
}

template <class T> T queue_list<T>::Top() {
	if (!head_of_queue)
	        throw "Очередь пуста.";

        return tail_of_queue->qData.data;
}

/******************************************************************************/

template <class T> queue_array<T>::queue_array() {
        size = part = 1;
        current = -1;
        sorting = false;
        sort_function = default_sort_function;
        array = new queue_element<T>[size];
        if (!array)
                throw "Невозможно выделить память под очередь.";
}

template <class T> queue_array<T>::queue_array(int part_size) {
        size = part = part_size;
        current = -1;
        sorting = false;
        sort_function = default_sort_function;
        array = new queue_element<T>[size];
        if (!array)
                throw "Невозможно выделить память под очередь.";
}

template <class T> queue_array<T>::~queue_array() {
        if (array) {
                delete [] array;
                array = NULL;
                size = 0;
                current = -1;
        }
}

template <class T> bool queue_array<T>::IsFull() {
        return (current == size - 1)?true:false;
}

template <class T> void queue_array<T>::Insert(T TData, int Priority) {
        if (IsFull())
                Resize();

        sorting = false;
        current++;
        array[current].data = TData;
        array[current].priority = Priority;
}

template <class T> T queue_array<T>::Pop() {
        if (current < 0)
                throw "Очередь пуста.";

        if (!sorting)
                Sort();

        return array[current--].data;
}

template <class T> T queue_array<T>::Top() {
        if (current < 0)
                throw "Очередь пуста.";

        if (!sorting)
                Sort();
        
        return array[current].data;
}

template <class T> void queue_array<T>::Resize() {
        if (array) {
                queue_element<T>* new_array;

                new_array = new queue_element<T>[size + part];
                if (!new_array)
                        throw "Невозможно увеличить размер очереди - не хватает памяти.";

                CopyMemory(new_array, array, sizeof(queue_element<T>) * (current + 1));

                delete [] array;
                array = new_array;
                size += part;
        }
}

template <class T> void queue_array<T>::Resize(int nSize) {
        if (nSize >= size)
                Resize();
        else
        if (array) {
                queue_element<T>* new_array;

                new_array = new queue_element<T>[nSize];
                if (!new_array)
                        throw "Невозможно изменить размер очереди - не хватает памяти.";

                CopyMemory(new_array, array, sizeof(queue_element<T>) * nSize);

                delete [] array;
                array = new_array;
                size = nSize;
                current = size - 1;
        }
}

int default_sort_function(const void *a, const void *b) {
        return(strcmp((char *)a, (char *)b));
}

template <class T> void queue_array<T>::Sort() {
        qsort((void *)array, current + 1, sizeof(array[0]), sort_function);
        sorting = true;
}

/******************************************************************************/

#endif /* QUEUE_H */
