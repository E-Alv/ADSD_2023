# https://medium.com/swlh/visualizing-the-mandelbrot-set-using-python-50-lines-f6aa5a05cf0f

from PIL import Image
import colorsys
import math
import os # file handling
import time # assessing performance

for num_runs in range(1):

    start = time.time()
    # os.remove("output.png")
    #frame parameters
    width_pix = 800 # pixels, 1000, 800
    height = 600
    aspectRatio = 4/3 # 4/3, 16/9
    ppm_max_colors = 15 # 15, 255
    x_coord = -0.5 # centers image of interest within frame
    y_coord = 0
    x_range = 4 # 3.4
    y_range = 3
    max_iters = 75 # 500

    #height = round(width_pix / aspectRatio)
    
    min_x = x_coord - x_range / 2
    max_x = x_coord + x_range / 2
    min_y = y_coord - y_range / 2
    max_y = y_coord + y_range / 2

    img = Image.new('RGB', (width_pix, height), color = 'black')
    pixels = img.load()

    ppm_header = ["P3\n", str(width_pix), ' ', str(height), "\n", str(ppm_max_colors), "\n" ]
    file = open(f'{width_pix}' + '_' + f'{height}' + '_' + f'{max_iters}' + '.ppm', 'w')
    file.writelines(ppm_header)

    dist_list =[]
    x_list = []
    
    #def logColor(distance, base, const, scale):
    #    color = -1 * math.log(distance, base)
    #    rgb = colorsys.hsv_to_rgb(const + scale * color,0.8,0.9)
    #    return tuple(round(i * 255) for i in rgb)

    #def powerColor(distance, exp, const, scale):
    #    color = distance**exp
    #    rgb = colorsys.hsv_to_rgb(const + scale * color, 1 - 0.6 * color, 0.9)
    #    return tuple(round(i * 255) for i in rgb)
    
    def color_4bit(distance):
        #print(distance)
        dist_str = (str(distance)[2:8]).ljust(8, '0')
        #print(dist_str)
        red = round(float(dist_str[0:2]) / 100 * 15)
        #print('red: ', red)
        green = round(float(dist_str[2:4]) / 100 * 15)
        #print('green: ', green)
        blue = round(float(dist_str[4:6]) / 100 * 15)
        #print('blue: ', blue)
        rgb = (red, green, blue)
        return tuple(rgb)


    for row in range(height):
        for col in range(width_pix):
            x_coord = min_x + col * x_range / width_pix
            #x_list.append(x_coord)
            #print(x)
            y = max_y - row * y_range / height
            old_x = x_coord
            old_y = y_coord
            
            for iters in range(max_iters + 1):
                a = x_coord * x_coord - y_coord * y_coord #real component of z^2
                b = 2 * x_coord * y_coord #imaginary component of z^2
                x_coord = a + old_x #real component of new z
                #print(x)
                x_list.append(x_coord)
                y_coord = b + old_y #imaginary component of new z

                if x_coord * x_coord + y_coord * y_coord > 4:
                    break

            if iters < max_iters:
                distance = (iters + 1) / (max_iters + 1)
                #print(distance)
                dist_list.append(distance * 10) # to determine min & max values
                #rgb = powerColor(distance, 0.2, 0.27, 1.0)
                rgb_4bit = color_4bit(distance)
                #print(rgb_4bit, '\n')
                #print(type(rgb_4bit))
                pixels[col, row] = rgb_4bit # rgb

                rgb_str_clean = str(rgb_4bit).replace(',', '').replace('(', '').replace(')', '')
                rgb_line=[rgb_str_clean, "\n"]
                file.writelines(rgb_line)
            
            else:
                rgb_str_clean = '0 0 0'
                rgb_line=[rgb_str_clean, "\n"]
                file.writelines(rgb_line)

            index = row * width_pix + col + 1
           # print("{} / {}, {}%".format(index, width_pix * height, round(index / width_pix / height * 100 * 10) / 10))


    file.close
    end = time.time()
    elapsed = end - start
    print(elapsed)
    #img.save(str(width_pix) + "_" + str(height) + "_" + str(max_iters) + '_' + str(round(elapsed, 2)) + '_output.png')
    print("run", num_runs + 1, "done")
    #print("min_dist: ", min(dist_list))
    #print("max_dist: ", max(dist_list))
    print("min_x: ", min(x_list))
    print("max_x: ", max(x_list))

# currently running this on WSL ubuntu so no opening images
#os.system('open output.png')