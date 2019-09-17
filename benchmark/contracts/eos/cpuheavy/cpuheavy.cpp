#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract]] cpuheavy : public contract {
  public:
      using contract::contract;

      [[eosio::action]]
      void sort( int size ) {
         int* arr = new int[size];
	 for(int x = 0; x < size; x++) {
		 arr[x] = size-x;
		// print("index ", x, " =  ", size-x, " //// "); 
	 }
	 quickSort(arr, 0, size-1);
	 print("Completed sort");
      }
  private:
      void quickSort(int *arr, int start, int end) {
	if(start >= end) return;

	int pivot = start;
	int i = pivot + 1;
	int j = end;
	int temp;

	while(i <= j) {
		while( i <= end && arr[i] <= arr[pivot]) {
			i++;
		}
		while( j > start && arr[i] >= arr[pivot]) {
			j--;
		}

		if( i > j ) {
			temp = arr[j];
			arr[j] = arr[pivot];
			arr[pivot] = temp;
		} else {
			temp = arr[i];
			arr[i] = arr[j];
			arr[j] = temp;
		}
	}

	quickSort(arr, start, j - 1);
	quickSort(arr, j + 1, end);
      }
};

EOSIO_DISPATCH( cpuheavy, (sort) )
