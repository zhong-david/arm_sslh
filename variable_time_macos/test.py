import os
import subprocess

p = os.path.dirname(__file__)

def modify_line(file_name, line_num, new_instruction):
    lines = open(file_name, 'r').readlines()
    lines[line_num] = new_instruction
    out = open(file_name, 'w')
    out.writelines(lines)
    out.close()
	
def compile():

    os.system("clang main.c eviction.c counter_thread.c ")
	
def run(val):
    run_str = "./a.out " + str(val)
    output =os.popen(run_str).read()
    return output

def parser(attack_output):
    tab = attack_output.split()[0:32]
    
    return tab


def main():
    # thresholds = []
    os.chdir(os.path.dirname(os.path.abspath(__file__)))

    val = 3735927486
    thresholds = []
    threshold_base = 120 
    num_thresholds = 5
    threshold_stride = 100
    for i in range(num_thresholds):
         thresholds.append(threshold_base + i*threshold_stride)
    compile()

    arr = [0] * 32
    for _ in range(10):
        

        output = run(val)
        tab = parser(output)
        for j in range(32):
            arr[j] += int(tab[j])
    print(arr)
    

    #return arr
		

if __name__ == "__main__":
	main()
