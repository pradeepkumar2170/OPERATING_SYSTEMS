
#include<iostream>
#include<cstring>
#include<sstream>
#include<fstream>
#include<string>
#include<vector>
#include<cmath>

using namespace std;

// Function description : When page found, this function will update the second chance bit into true
bool SearchAndUpdate(uint64_t x, uint64_t arr[],
	bool second_chance[], int frames)

{
	int i;
	for (i = 0; i < frames; i++)
	{
		if (arr[i] == x)
		{
			second_chance[i] = true; // Mark that the page deserves a second chance
			//and returning true here which signifies that there was a hit so no page replaced
			return true;
		}
	}

	// if there was not hit we are returning 'false' so that a page for replacement is selected since the requested page isn't in memory
	return false;

}

// Function description: This function will update the page in memory and also return the pointer
int replacePageAndUpdate(uint64_t x, uint64_t arr[], bool second_chance[], int frames, int pointer)
{
	while (true)
	{
		if (!second_chance[pointer]) // if the value of the second chance for the pointer is zero we can replace the page with the new page
		{
			arr[pointer] = x;
			second_chance[pointer] = true;
			// we update and return the pointer
			return (pointer + 1) % frames;
		}

		// Mark it 'false' as it got one chance and will be replaced next time unless accessed again
		second_chance[pointer] = false;  // update it as false so that it can be replaced next time
		pointer = (pointer + 1) % frames; // update the value of pointer 
	}
}
// Function Description : Below function performs second chance paging 
uint64_t secondChancePaging(vector <uint64_t> reference_string, int frames)
{
	int pointer;
	uint64_t x, pf;

	//initially we keep the pointer to be set at 0 and  the number of page fault is initialized to 0
	pointer = 0;
	pf = 0;

	// Create a array to hold page numbers
	uint64_t* arr = new uint64_t[frames];
	// No pages initially in frame, so set it by -1
	memset(arr, -1, sizeof(arr));

	// Creating  a second chance array.
	bool* second_chance = new bool[frames];

	for (size_t i = 0; i < reference_string.size(); i++)
	{
		x = reference_string[i];

		// Finds if there exists a need to replace
		// any page at all
		if (!SearchAndUpdate(x, arr, second_chance, frames))
		{
			// This Selects and updates the victim page
			pointer = replacePageAndUpdate(x, arr, second_chance, frames, pointer);

			// Update the number of page faults
			pf++;
		}
	}
	delete [] arr;
	delete [] second_chance;
	arr = NULL;
	second_chance = NULL;
	return pf;
}

uint64_t hexStringToI(string x,int n)
{
	uint64_t result = stoll(x, 0, 16);
	

	//commented block to print input read hex string from file
	//std::stringstream sstream;
	//sstream << std::hex << result;
	//std::string output = sstream.str();
	//cout<< result << " | " << output << endl;

	result = result >> n;
	//to print page number
	//	cout << result << endl;  
	return result;
}

int main()
{
	while (1)

	{
		string filename = "";
		int page_size = 0; // KB
		int mem_size = 0; // KB
		uint64_t page_faults = 0;
		cin >> filename >> mem_size >> page_size;
		vector <string> result;
		vector <uint64_t> ref_string;
		std::ifstream file(filename);
		std::string str;
		std::string file_contents;
		while (std::getline(file, str, ' '))
		{
			file_contents += str;
			file_contents.push_back('\n');

		}

		int m = 32;  // 32 bit machine // bits for logical address

		int n = 0;
		n = int(log2(page_size * 1024)); // no of bits for address offset
		//cout << "n:" << n << endl;
		int frames = mem_size / page_size;  //Number of entries in inverted page table = physical address space / page size
		//cout << "frames:" << frames << endl;

		int page_tbl_addr_bits = m - n;
		//cout << "Page Number bits:" << page_tbl_addr_bits << endl;
		//cout << "-----------------------------------------------" << endl;

		// put check for accepted page size and mem size

		// split string to array----------------------------------
		auto ss = std::stringstream{ file_contents };

		for (std::string line; std::getline(ss, line, '\n');)
		{
			if (line.length() > 1)
				ref_string.push_back(hexStringToI(line, n)); // directly converting and shifting to get required page number saves iteration
			else
				continue;

		}
		//------------------------print reference hex string having page value--------------------------------------------//

		//for (size_t i = 0; i < ref_string.size(); i++)
		//{

		//	std::stringstream sstream;
		//	sstream << std::hex << ref_string[i];
		//	std::string result = sstream.str();
		//	cout << i << " " << ref_string[i] << " | " << result << endl;
		//}
		//------------------------print reference hex string having page value--------------------------------------------//

		page_faults = secondChancePaging(ref_string, frames);


		cout << "----------------------------------------------------" << endl;
		cout << "Trace file:" << filename << endl;
		cout << "Memory Size:" << mem_size << "KB" << endl;
		cout << "Page Size:" << page_size << "KB" << endl;
		cout << "Page Faults:" << page_faults << endl;
		cout << "----------------------------------------------------" << endl;

	}
	return 0;
}
