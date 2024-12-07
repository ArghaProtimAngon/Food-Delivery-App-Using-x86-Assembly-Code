.MODEL SMALL
.STACK 100H
.DATA  
    list_of_user db 10*20 dup(20h) ;20 names of string size 10  
    list_of_user_password db 10*20 dup(20h)
    list_of_user_size db ?  
    
    list_of_rider db 10*20 dup(20h) ;20 names of string size 10 
    list_of_rider_password db 10*20 dup(20h)
    list_of_rider_size db ? 
    
    list_of_admin db 10*20 dup(20h) ;20 names of string size 10 
    list_of_admin_size db ?
      
    username_match_flag db 1
    password_match_flag db 1 
    username_index db ?
    si_for_temp_string dw ?
    si_for_main_string dw ? 
    temp_string db 10 dup(20h) 
    temp_string_password 10 dup(20h)
    
    temp_number db ?
    
    logged_in_username_index db ?
    logged_in_rider_index db ? 
    cart db 10*4 dup(20h) ;10 cart of size 4 for 10 user
    number_of_food_ordered db 10 dup(?) ;this contains number 0f food ordered for each user
    user_status db 10 dup(?) ;it can hold 3 value, 0=no order, 1= not deliever, 2= delivered 
    
    user_to_print db ?  
    loop_counter db ? 
    number_of_user_to_deliver db ?
    
    b db 0d,0ah,0ah,0ah,"What do you want to do?",0ah,0dh,"1.Login",0ah,0dh,"2.Register",0ah,0dh,"Type here: ",  "$"
    a db "Enter type of user",  "$" 
    c db 0ah,0dh,"!!!!!!INCORRECT INPUT!!!!!!!",0ah,0dh,"$"
    d db  "Enter Username: ", "$" 
    e db 0d,0ah,0ah,0ah,"What type of Account?",0ah,0dh,"1.User",0ah,0dh,"2.Rider",0ah,0dh,"3.Admin",0ah,0dh,"Type here: ","$" 
    f db 0d,0ah,0ah,0ah,"Register Successfull",0ah,0dh,0ah,0dh,0ah,0dh,0ah,0dh,0ah,0dh,0ah,0dh,0ah,0dh,0ah,0dh,0ah,0dh,"$"
    g db "Enter Password: ","$" 
    h db 0d,0ah,0ah,0ah,"What do you want to do?",0ah,0dh,"1.See all Username",0ah,0dh,"2.See all Rider's name",0ah,0dh,"3.Log Out",0ah,0dh,"Type here: ",  "$"
    i db 0d,0ah,0ah,0ah,"Incorrect Username",0dh,0ah, "$" 
    j db 0d,0ah,0ah,0ah,"Incorrect password",0dh,0ah, "$"
    k db 0d,0ah,0ah,0ah,0ah,0ah,0ah,"*******************USER PANEL***************************",0dh,0ah,"$"
    l db 0ah,0d,0ah,0ah,"What would you like to do?",0ah,0dh,"1.Order food(At most 4 items from menu)",0ah,0dh,"2.Look at cart",0ah,0dh,"3.Cancel Last order",0dh,0ah,"4.Check Order Status",0ah,0dh,"5.Log Out",0ah,0dh, "Ener input here: ","$"
    m db 0d,0ah,0ah,0ah,"What would you like to order?",0ah,0dh,"1.Burger",0ah,0dh,"2.Pizza",0ah,0dh,"3.Milkshake",0ah,0dh,"4.Lasagna",0ah,0dh,"5.Paratha",0ah,0dh,"6.Coffee",0ah,0dh,"7.Tea",0ah,0dh,"8.Taco",0ah,0dh,"9.Pasta",0ah,0dh,"Enter Input Here: ","$"
    n db 0d,0ah,0ah,0ah,"The menu is:",0ah,0dh,"1.Burger",0ah,0dh,"2.Pizza",0ah,0dh,"3.Milkshake",0ah,0dh,"4.Lasagna",0ah,0dh,"5.Paratha",0ah,0dh,"6.Coffee",0ah,0dh,"7.Tea",0ah,0dh,"8.Taco",0ah,0dh,"9.Pasta",0ah,0dh,"$"
    o db 0d,0ah,0ah,0ah,"You have ordered the following items from menu: ","$"  
    p db 0d,0ah,0ah,0ah,"You have not orered anything. ",0d,0ah,0ah,0ah,0ah,0ah,0ah,"$"
    q db 0d,0ah,0ah,0ah,"Your order has not been delievered yet. ",0d,0ah,0ah,0ah,0ah,0ah,0ah,"$"
    r db 0d,0ah,0ah,0ah,"Your order has been delievered  ",0d,0ah,0ah,0ah,0ah,0ah,0ah,"$" 
    s db 0d,0ah,0ah,0ah,,"*******************RIDER PANEL***************************",0dh,0ah,"$" 
    t db 0d,0ah,0ah,0ah,"What do you want to do?", 0ah,0dh, "1.See all orders",0ah,0dh,"2. Choose an order to deliver",0ah,0dh,"3.Log out",0ah,0dh,"Enter Input Here: ","$"
    u db "Username: $"  
    v db 0ah,0dh,"Order number: $" 
    w db 0ah,0dh,"Which User would you like to deliver to?",0ah,0dh,"Enter input here: ","$"
    x db 0d,0ah,0ah,0ah,0ah,0ah,0ah,"This user has not ordered anything. Choose another User.",0d,0ah,0ah,0ah,0ah,0ah,0ah,"$" 
    y db 0d,0ah,0ah,0ah,0ah,0ah,0ah,"The order has been already delivered.",0d,0ah,0ah,0ah,0ah,0ah,0ah,"$" 
    z db 0d,0ah,0ah,0ah,0ah,0ah,0ah,"The order has been Successfully delivered.",0d,0ah,0ah,0ah,0ah,0ah,0ah,"$"
    ; DEFINE YOUR VARIABLES 
   
.CODE  
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE    
        
        
        
        
        
        
        
        
        
        ;Login and regiser choice====================================================================
         
         login_and_register_choice: 
         
             ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
         
             lea dx, b
             mov ah,9
             int 21h 
             
             mov ah,1
             int 21h
             
             cmp al,31h
             je login
             cmp al, 32h
             je register
             jmp wrong_input
            
             
         
         
         exit_login_and_register_choice:
         ;============================================================================================
               
               
               
               
               
               



               
               
           
           
           
           
           
         
         ;login =======================================================================================
         login:
            
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
            
            ;check type of user
            lea dx, e
            mov ah,9
            int 21h 
            
            mov ah,1
            int 21h
            cmp al, 31h
            je user_login
            cmp al,32h
            je rider_login
            cmp al, 33h
            je admin_login 
            jmp wrong_input
            
            ;end check type of user

         exit_login:
         ;=============================================================================================
              
              
            
            
            
            
            
            
            
            
            
            
              
              
         ;register =====================================================================================
         register:
         
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
            
            lea dx, e
            mov ah,9
            int 21h 
            
            mov ah,1
            int 21h
            
            cmp al,31h
            je user_register
            cmp al, 32h
            je rider_register   
            jmp wrong_input
         
         exit_register:
         ;=============================================================================================     
              
             
             
             
              
         
              
              
              
              
              
             
              
         ;user register =================================================================================
         user_register:
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
             
              
            ;username part
            mov ah,9
            lea dx, d
            int 21h
            
            
            ;take username and store it to list of user
            
            ;multiply 10 with list_of_user_size for calculating offset
            mov al, list_of_user_size
            mov bl, 10
            mul bl            
            ;end multiply 10 with list_of_user_size for calculating offset
            
            mov si, 0
            add si,ax
            
            mov cx, 10
            mov ah,1
            loop_for_taking_username_user_register:
                int 21h
                
                cmp al, 0dh
                je if1
                jmp skip_if1
                
                if1:
                    jmp exit_loop_for_taking_username_user_register
                        
                skip_if1:
                mov list_of_user[si], al
                inc si                    
                loop loop_for_taking_username_user_register    
            exit_loop_for_taking_username_user_register:
            ;end username part
            
               
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code   
               
               
            ;password part
            mov ah,9
            lea dx, g
            int 21h
            
            
            ;take username and store it to list of user
            
            ;multiply 10 with list_of_user_size for calculating offset
            mov al, list_of_user_size
            mov bl, 10
            mul bl            
            ;end multiply 10 with list_of_user_size for calculating offset
            
            mov si, 0
            add si,ax
            
            mov cx, 10
            mov ah,1
            loop_for_taking_username_password_user_register:
                int 21h
                
                cmp al, 0dh
                je if2
                jmp skip_if2
                
                if2:
                    jmp exit_loop_for_taking_username_password_user_register
                        
                skip_if2:
                mov list_of_user_password[si], al
                inc si                    
                loop loop_for_taking_username_password_user_register    
            exit_loop_for_taking_username_password_user_register:
            ;end password part
            
            
         
            ;increment list_of_user_size
            mov al, list_of_user_size
            inc al
            mov list_of_user_size,al
            
            jmp login_and_register_choice                        
            
            ;end take username and store it to list of user
               
         exit_user_register:     
         ;============================================================================================= 
         
         
         
         
         
         
         ;rider register===================================================================================
         rider_register:
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
             
            
            ;username part
            mov ah,9
            lea dx, d
            int 21h
            
            
            ;take username and store it to list of user
            
            ;multiply 10 with list_of_user_size for calculating offset
            mov al, list_of_rider_size
            mov bl, 10
            mul bl            
            ;end multiply 10 with list_of_user_size for calculating offset
            
            
            mov si, 0
            add si, ax
            
            mov cx, 10
            mov ah,1
            loop_for_taking_username_rider_register:
                int 21h
                
                cmp al, 0dh
                je if3
                jmp skip_if3
                
                if3:
                    jmp exit_loop_for_taking_username_rider_register
                        
                skip_if3:
                mov list_of_rider[si], al
                inc si                    
                loop loop_for_taking_username_rider_register    
            exit_loop_for_taking_username_rider_register:
            ;end username part
            
                  
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code   
               
               
            ;password part
            mov ah,9
            lea dx, g
            int 21h
            
            
            ;take username and store it to list of user
            
            ;multiply 10 with list_of_user_size for calculating offset
            mov al, list_of_rider_size
            mov bl, 10
            mul bl            
            ;end multiply 10 with list_of_user_size for calculating offset
            
            mov si, 0
            add si,ax
            
            mov cx, 10
            mov ah,1
            loop_for_taking_username_password_rider_register:
                int 21h
                
                cmp al, 0dh
                je if4
                jmp skip_if4
                
                if4:
                    jmp exit_loop_for_taking_username_password_rider_register
                        
                skip_if4:
                mov list_of_rider_password[si], al
                inc si                    
                loop loop_for_taking_username_password_rider_register    
            exit_loop_for_taking_username_password_rider_register:
            ;end password part
            
            
            ;increment list_of_user_size
            mov al, list_of_rider_size
            inc al
            mov list_of_rider_size,al
            
            jmp login_and_register_choice                        
            
            ;end take username and store it to list of user
               
         exit_rider_register:
         ;=============================================================================================
         
         
         
         
         
         
         
         
         
         
             
         ;User Login===================================================================================
         user_login:
         
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
                
            lea dx, d
            mov ah, 9
            int 21h             
            
            
            ;clean temp_string
            mov cx,10
            mov si,0
            loop_for_cleaning_temp_string_user_login:
                mov si[temp_string], 20h
                
                inc si
                loop loop_for_cleaning_temp_string_user_login    
            ;end clean temp_string
            
            
            ;clean temp_string_password
            mov cx,10
            mov si,0
            loop_for_cleaning_temp_string_password_user_login:
                mov si[temp_string], 20h
                
                inc si
                loop loop_for_cleaning_temp_string_password_user_login
            ;end clean temp_string_password
            
            
            
            
            ;take username from user and store in temp_string
            mov cx, 10
            mov si,0
            mov ah,1            
            loop_for_taking_username_user_login:
                int 21h
                cmp al, 0dh 
                je if5
                jmp skip_if5
                if5:
                    jmp exit_loop_for_taking_username_user_login
                skip_if5:
                mov temp_string[si],al
                inc si
                loop loop_for_taking_username_user_login        
            exit_loop_for_taking_username_user_login:
            ;end take username from user and store in temp_string
            
             
             
             
             
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code       
              
              
                   
                   
            
            ;take password from user and store it in temp_string_password
            lea dx,g
            mov ah, 9
            int 21h
            
            mov cx, 10
            mov si,0
            mov ah,1            
            loop_for_taking_password_user_login:
                int 21h
                cmp al, 0dh 
                je if8
                jmp skip_if8
                if8:
                    jmp exit_loop_for_taking_password_user_login
                skip_if8:
                mov temp_string_password[si],al
                inc si
                loop loop_for_taking_password_user_login        
            exit_loop_for_taking_password_user_login:
            ;end take password from user and store it in temp_string_password  
            
            
            
            
            
            
            
            
            ;find index of username 
         
            mov cx, 20  
            mov si_for_main_string, 0 
            mov username_index, 0
            
            loop_for_checking_each_username_for_user: 
            
            
                ;reset user_name_match_flag to 1
                mov username_match_flag, 1
                
                mov si_for_temp_string, 0
                mov bx,0
                loop_for_interating_through_each_string_user:
                    cmp bx,10
                    jge exit_loop_for_interating_through_each_string_user
                    
                    mov si, si_for_main_string
                    mov al, list_of_user[si]
                    mov si, si_for_temp_string
                    mov ah, temp_string[si]
                    
                    cmp ah,al
                    jne if6:
                    jmp skip_if6:
                    if6:
                        mov username_match_flag, 0
                    skip_if6:
                    
                    mov ax, si_for_temp_string
                    inc ax
                    mov si_for_temp_string, ax
                    
                    mov ax, si_for_main_string
                    inc ax
                    mov si_for_main_string, ax
                    
                    inc bx
                    jmp loop_for_interating_through_each_string_user 
                    
                exit_loop_for_interating_through_each_string_user: 
                
                cmp username_match_flag, 1
                je check_password_for_username_user
                
                mov al, username_index
                inc al
                mov username_index, al 
                

                loop loop_for_checking_each_username_for_user
            exit_loop_for_checking_each_username_for_user:
            
            jmp wrong_username_alert
            ;end find index of username
            
                    
                    
                    
                    
                    
         
            ;check password for selected index====================================== 
            check_password_for_username_user:
                ;reset temp_string 
                mov si,0
                mov cx, 10
                loop_for_resetting_temps_user:
                    mov temp_string[si], 20h
                    loop loop_for_resetting_temps_user
                ;end reset temp_string 
                
                ;multiply 10 with username_index
                mov al, username_index
                mov bl,10
                mul bl
                
                mov si_for_main_string, ax
                mov password_match_flag, 1
                mov cx, 10 
                mov si_for_temp_string, 0
                loop_for_checking_password_user:
                    
                    mov si, si_for_temp_string
                    mov al, temp_string_password[si]
                    mov si, si_for_main_string
                    mov ah, list_of_user_password[si] 
                    
                    
                    cmp al,ah
                    jne if9
                    jmp skip_if9
                    if9:
                        
                        mov password_match_flag, 0
                    skip_if9:
                    
                    
                    mov ax, si_for_temp_string
                    inc ax
                    mov si_for_temp_string, ax
                    
                    mov ax, si_for_main_string
                    inc ax
                    mov si_for_main_string, ax
                    
                    
                    loop loop_for_checking_password_user
                exit_loop_for_checking_password_user:
                
                mov al, 1
                cmp al, password_match_flag
                je user_panel
                jmp wrong_password_alert
                
            exit_check_password_for_username_user:
            ;end check password for selected index==================================
         
         
            
            
               
         exit_user_login:
         ;=============================================================================================
         
                       
               
               
               
               
               
               
               
               
               
               
               
         
              
              
              
         ;wrong_username_alert============================================================================
         ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
         
         
         ;reset temp_string and temp_string_password
         mov si,0
         mov cx,10
         loop_for_reset_username:
            mov temp_string[si], 20h
            mov temp_string_password[si], 20h
            
            inc si
            loop loop_for_reset_username
         
         ;end reset temp_string and temp_string_password
         
         
         wrong_username_alert:
            lea dx, i
            mov ah,9
            int 21h
            
            jmp login_and_register_choice
         
         exit_wrong_username_alert:     
         ;=============================================================================================
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
         
         ;wrong_password_alert============================================================================
         wrong_password_alert:
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
             
            ;reset temp_string and temp_string_password
            mov si,0
            mov cx,10
            loop_for_reset_password:
                mov temp_string[si], 20h
                mov temp_string_password[si], 20h
                
                inc si
                loop loop_for_reset_password
         
            ;end reset temp_string and temp_string_password
            
             
            lea dx, j
            mov ah,9
            int 21h
            
            jmp login_and_register_choice
         
         exit_wrong_password_alert:     
         ;=============================================================================================
         
         
         
              
              
              
              
              
         
         
         ;rider login===================================================================================
         rider_login:
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
            
            
            ;clean temp_string
            mov cx,10
            mov si,0
            loop_for_cleaning_temp_string_rider_login:
                mov si[temp_string], 20h
                
                inc si
                loop loop_for_cleaning_temp_string_rider_login    
            ;end clean temp_string
            
            
            ;clean temp_string_password
            mov cx,10
            mov si,0
            loop_for_cleaning_temp_string_password_rider_login:
                mov si[temp_string], 20h
                
                inc si
                loop loop_for_cleaning_temp_string_password_rider_login
            ;end clean temp_string_password
            
            
                
            lea dx, d
            mov ah, 9
            int 21h             
            
            ;take username from rider and store in temp_string
            mov cx, 10
            mov si,0
            mov ah,1            
            loop_for_taking_username_rider_login:
                int 21h
                cmp al, 0dh 
                je if15
                jmp skip_if15
                if15:
                    jmp exit_loop_for_taking_username_rider_login
                skip_if15:
                mov temp_string[si],al
                inc si
                loop loop_for_taking_username_rider_login        
            exit_loop_for_taking_username_rider_login:
            ;end take username from user and store in temp_string
            
             
             
             
             
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code       
              
              
                   
                   
            
            ;take password from user and store it in temp_string_password
            lea dx,g
            mov ah, 9
            int 21h
            
            mov cx, 10
            mov si,0
            mov ah,1            
            loop_for_taking_password_rider_login:
                int 21h
                cmp al, 0dh 
                je if18
                jmp skip_if18
                if18:
                    jmp exit_loop_for_taking_password_rider_login
                skip_if18:
                mov temp_string_password[si],al
                inc si
                loop loop_for_taking_password_rider_login        
            exit_loop_for_taking_password_rider_login:
            ;end take password from user and store it in temp_string_password  
            
            
            
            
            
            
            
            
            ;find index of username 
         
            mov cx, 20  
            mov si_for_main_string, 0 
            mov username_index, 0
            
            loop_for_checking_each_username_for_rider: 
            
            
                ;reset user_name_match_flag to 1
                mov username_match_flag, 1
                
                mov si_for_temp_string, 0
                mov bx,0 ;bx used as loop counter
                loop_for_interating_through_each_string_rider:
                    cmp bx,10
                    jge exit_loop_for_interating_through_each_string_rider
                    
                    mov si, si_for_main_string
                    mov al, list_of_rider[si]
                    mov si, si_for_temp_string
                    mov ah, temp_string[si]
                    
                    cmp ah,al
                    jne if16:
                    jmp skip_if16:
                    if16:
                        mov username_match_flag, 0
                    skip_if16:
                    
                    mov ax, si_for_temp_string
                    inc ax
                    mov si_for_temp_string, ax
                    
                    mov ax, si_for_main_string
                    inc ax
                    mov si_for_main_string, ax
                    
                    inc bx
                    jmp loop_for_interating_through_each_string_rider 
                    
                exit_loop_for_interating_through_each_string_rider: 
                
                cmp username_match_flag, 1
                je check_password_for_username_rider
                
                mov al, username_index
                inc al
                mov username_index, al 
                

                loop loop_for_checking_each_username_for_rider
            exit_loop_for_checking_each_username_for_rider:
            
            jmp wrong_username_alert
            ;end find index of username
            
                    
                    
                    
                    
                    
         
            ;check password for selected index====================================== 
            check_password_for_username_rider:
                ;reset temp_string 
                mov si,0
                mov cx, 10
                loop_for_resetting_temps_rider:
                    mov temp_string[si], 20h
                    loop loop_for_resetting_temps_rider
                ;end reset temp_string 
                
                ;multiply 10 with username_index
                mov al, username_index
                mov bl,10
                mul bl
                
                mov si_for_main_string, ax
                mov password_match_flag, 1
                mov cx, 10 
                mov si_for_temp_string, 0
                loop_for_checking_password_rider:
                    
                    mov si, si_for_temp_string
                    mov al, temp_string_password[si]
                    mov si, si_for_main_string
                    mov ah, list_of_rider_password[si] 
                    
                    
                    cmp al,ah
                    jne if19
                    jmp skip_if19
                    if19:
                        
                        mov password_match_flag, 0
                    skip_if19:
                    
                    
                    mov ax, si_for_temp_string
                    inc ax
                    mov si_for_temp_string, ax
                    
                    mov ax, si_for_main_string
                    inc ax
                    mov si_for_main_string, ax
                    
                    
                    loop loop_for_checking_password_rider
                exit_loop_for_checking_password_rider:
                
                mov al, 1
                cmp al, password_match_flag
                je rider_panel
                jmp wrong_password_alert
                
            exit_check_password_for_username_rider:
            ;end check password for selected index==================================
         
         
            
            
               
         exit_rider_login:
         ;=============================================================================================
         
         
             
             
             
             
             
             
             
             
             
                       
                       
                       
              
              
         ;Admin login====================================================================================     
         admin_login:
         
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
         
             lea dx, g
             mov ah,9
             int 21h
             
             mov ah,1
             int 21h
             
             cmp al,31h
             je admin_panel
                    
         exit_admin_login:     
         ;=============================================================================================   
         
         
         
         
            
            
            
            
            
            
         
         
         
         ;wrong input=================================================================================
         wrong_input:
         lea dx, c 
         mov ah, 9
         int 21h
         jmp login_and_register_choice  
            
         
         exit_wrong_input:        
         ;============================================================================================ 
         
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************      
         ;************************************************************* ADMIN PANEL ****************************************************************************************      
         ;***********************************************************************************************************************************************************************
         ;***********************************************************************************************************************************************************************  
    
         
         admin_panel:
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
           
            lea dx, h
            mov ah, 9
            int 21h
            
            mov ah,1
            int 21h
            
            cmp al, 31h
            je print_all_username
            cmp al, 32h
            je print_all_ridername
            cmp al,33h
            je login_and_register_choice
            jmp wrong_input
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
            
            ;print all username======================================================================= 
            print_all_username: 
                
                ;newline and carriage return code
                 mov ah, 2  
                 mov dl, 0ah
                 int 21h
                 mov dl, 0dh
                 int 21h          
                 ; end of newline and carriage return code 
                 
                mov si, 0
                mov cx, 200 
                mov ah,2
                loop_for_printing_all_username:
                    mov dl, list_of_user[si]
                    int 21h
                    inc si
                    loop loop_for_printing_all_username
                      
            
            jmp admin_panel       
            exit_print_all_username:
            ;============================================================================================      
             
                           
                           
               
               
               
               
               
                           
                           
                           
                           
                           
                           
                           
             
            ;print all ridername ;============================================================================================
            print_all_ridername: 
                
                ;newline and carriage return code
                 mov ah, 2  
                 mov dl, 0ah
                 int 21h
                 mov dl, 0dh
                 int 21h          
                 ; end of newline and carriage return code 
                 
                mov si, 0
                mov cx, 200 
                mov ah,2
                loop_for_printing_all_ridername:
                    mov dl, list_of_rider[si]
                    int 21h
                    inc si
                    loop loop_for_printing_all_ridername
                      
            
            jmp admin_panel       
            exit_print_all_ridername:
            ;============================================================================================
             
             
         exit_admin_panel:  
         
         
         
         ;***********************************************************************************************************************************************************************      
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************    
         
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************      
         ;************************************************************* USER PANEL ****************************************************************************************      
         ;***********************************************************************************************************************************************************************
         ;***********************************************************************************************************************************************************************
         user_panel:
         mov al, username_index
         mov logged_in_username_index, al
         
         lea dx, k
         mov ah,9
         int 21h      
         
         user_choices:
            mov ah,9 
            lea dx, l
            int 21h
            
            mov ah,1
            int 21h
            
            cmp al, 31h
            je order_food
            
            cmp al, 32h
            je look_at_cart
            
            cmp al, 33h
            je cancel_order 
                           
            cmp al, 34h
            je check_status
            
            cmp al, 35h
            je login_and_register_choice
            
            jmp wrong_input 
              
               
         
         ;order food==================================================================================
         order_food:
            ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
            
            mov ah,0
            mov al, logged_in_username_index
            mov si,0
            add si, ax
            mov si[user_status],1
            
            lea dx, m
            mov ah,9
            int 21h
            
            mov ah,1
            int 21h
            mov dl, al  ;temporary store food-order in dl
            
            ;muliply by 4 to find the index where to input in cart
            mov al,logged_in_username_index
            mov bl, 4
            mul bl
            
            ;add by number_of_food_ordered to calculate offset
            mov bh,0 
            mov si, 0  
            mov ch,0
            mov cl, logged_in_username_index
            add si, cx
            mov bl, si[number_of_food_ordered] 
            add ax, bx
            
            mov si, ax
            mov si[cart], dl  
            
            ;increment number_of_food_ordered variable
            mov ch,0
            mov cl, logged_in_username_index
            add si, cx
            mov al, si[number_of_food_ordered]
            inc al
            mov si[number_of_food_ordered], al
            
            jmp user_choices 
               
            
         
         ;============================================================================================
         
         
         
         
         
         ;look at cart=================================================================================
         look_at_cart:
            mov ah,9
            lea dx, n
            int 21h  
            
            lea dx, o
            int 21h
            
            ;multiply 4 with logge in username index
            mov bl, logged_in_username_index
            mov al, 4
            mul bl
            
            mov si, ax
            
            
            mov cx,4
            loop_for_printing_user_cart:
                mov ah,2
                mov dl, si[cart]
                int 21h
                 
                ;print space
                mov dl, 20h
                int 21h
                 
                inc si
                loop loop_for_printing_user_cart            
            jmp user_choices         
            
         ;============================================================================================
         
         
         
         
         
         
         ;cancel order================================================================================= 
         cancel_order:
            ;decrement number_of_food_ordered variable 
            
            mov ch,0
            mov cl, logged_in_username_index  
            mov si,0
            add si, cx
            mov al, si[number_of_food_ordered]
            dec al
            mov si[number_of_food_ordered], al  
            mov cl, al ; cl contains number of food ordered for that user
            
            
            ;multiply 4 with logged in username index
            mov bl, logged_in_username_index
            mov al, 4
            mul bl 
            
            mov si,ax
            mov ch,0
            add si, cx
           
            
            mov si[cart], 20h
            
            jmp user_choices
         
         ;============================================================================================
                                           
                                           
                                           
                                           
                                           
                                           
                                           
                                           
                                           
         
         ;Check Status================================================================================ 
         check_status:
            mov al, logged_in_username_index 
            mov ah,0
            mov si,0
            add si, ax
            mov cl, si[user_status]     
            
            cmp cl,0
            je print_status0
            
            cmp cl, 1
            je print_status1
            
            cmp cl,2
            je print_status2
            
            jmp user_choices
            
            
            print_status0:
                mov ah, 9
                lea dx, p
                int 21h
                jmp user_choices 
                
            print_status1:
                mov ah, 9
                lea dx, q
                int 21h
                jmp user_choices  
                
            print_status2:
                mov ah, 9
                lea dx, r
                int 21h
                jmp user_choices
          
         ;============================================================================================
               
         exit_user_panel:      
         ;***********************************************************************************************************************************************************************      
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************     
              
         
         
         
         
         
         
         
         
         
         
         
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************      
         ;************************************************************* RIDER PANEL ****************************************************************************************      
         ;***********************************************************************************************************************************************************************
         ;***********************************************************************************************************************************************************************     
         rider_panel:
         mov al, username_index     
         mov logged_in_rider_index, al
         
         mov ah,9
         lea dx,s
         int 21h
         rider_choices:
            mov ah,9
            lea dx, t
            int 21h 
            
            mov ah,1
            int 21h
            
            cmp al,31h
            je see_all_order
            
            cmp al, 32h
            je deliver_order
            
            cmp al, 33h
            je login_and_register_choice
            
            jmp wrong_input
            
               
               
               
               
               
         ;see all order===============================================================================
         see_all_order:
         
             ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
             
             ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
            
             ;newline and carriage return code
             mov ah, 2  
             mov dl, 0ah
             int 21h
             mov dl, 0dh
             int 21h          
             ; end of newline and carriage return code
         
         
         
            mov ah, 9
            lea dx, n
            int 21h
            
            mov al,0
            mov user_to_print, al
            
            mov cx,10
            loop_for_printing_user_order_in_rider_panel:
                mov dl,user_to_print
                add dl,30h 
                mov ah,2
                int 21h
                
                mov dl, 02eh 
                int 21h
                mov dl, 20h
                int 21h
                
                
                ;multiply user_to_print by 10 to get index
                mov al,user_to_print
                mov bl, 10
                mul bl
                
                mov si,0
                add si,ax
                
                mov al, si[list_of_user]
                cmp al, 20h
                je skip_if30
                
                if30: ;if there is user inside the index, then username and order will be printed
                    mov ah,9
                    lea dx, u
                    int 21h
                    
                    ;multiply user_to_print by 10 to get index
                    mov al,user_to_print
                    mov bl, 10
                    mul bl
                    
                    mov si, 0
                    add si,ax
                    
                    mov ah,10
                    mov loop_counter, ah
                    
                    loop_for_printing_username_in_rider_panel:
                        mov ah, loop_counter
                        cmp ah,0
                        je exit_loop_for_printing_username_in_rider_panel:
                        
                        mov dl, si[list_of_user]
                        mov ah,2
                        int 21h
                        
                        
                        inc si
                        mov ah,loop_counter
                        dec ah
                        mov loop_counter, ah
                        jmp loop_for_printing_username_in_rider_panel:
                    exit_loop_for_printing_username_in_rider_panel:
                    
                    
                    mov ah,9
                    lea dx, v
                    int 21h
                    
                    ;multiply user_to_print by 10 to get index
                    mov al,user_to_print
                    mov bl, 4
                    mul bl
                    
                    mov si, 0
                    add si,ax
                    
                    mov ah,4
                    mov loop_counter, ah
                    
                    loop_for_printing_order_rider_panel:
                        mov ah, loop_counter
                        cmp ah, 0
                        je exit_loop_for_printing_order_rider_panel
                        
                        mov ah,2
                        mov dl, si[cart]
                        int 21h
                        
                        mov dl, 20h
                        int 21h
                                                                   
                        inc si
                        mov ah,loop_counter
                        dec ah
                        mov loop_counter, ah
                        jmp loop_for_printing_order_rider_panel
                    exit_loop_for_printing_order_rider_panel:
                
                skip_if30:
                
                
                ;newline and carriage return code
                 mov ah, 2  
                 mov dl, 0ah
                 int 21h
                 mov dl, 0dh
                 int 21h          
                ; end of newline and carriage return code
                
                ;newline and carriage return code
                 mov ah, 2  
                 mov dl, 0ah
                 int 21h
                 mov dl, 0dh
                 int 21h          
                 ; end of newline and carriage return code
                
                
                
                mov ah,user_to_print
                inc ah
                mov user_to_print, ah
                
                loop loop_for_printing_user_order_in_rider_panel
               
            
         ;============================================================================================
         
         
         
         
         
         
         
         ;deliver order===============================================================================
         deliver_order:
            mov ah, 9
            lea dx, w
            int 21h
            
            mov ah, 1
            int 21h
            
            sub al, 30h 
            mov number_of_user_to_deliver, al
            mov ah,0
            mov si,0
            add si,ax
            
            mov al, si[user_status]
            
            cmp al, 0h
            je print_user_has_no_order
            
            cmp al, 1h
            je deliver_user_order
            
            cmp al, 02h
            je print_order_has_already_been_delivered
            
            jmp rider_choices
                
            
            print_user_has_no_order:
                mov ah,9
                lea dx, x
                int 21h
                jmp rider_choices
                
                
            print_order_has_already_been_delivered:
                mov ah,9
                lea dx, y
                int 21h
                jmp rider_choices  
                
            deliver_user_order:
                ;set user status
                mov al, number_of_user_to_deliver
                mov ah,0
                mov si,0
                add si, ax
                mov si[user_status],2
                
                
                
                
            
                ;clear cart
                mov al, number_of_user_to_deliver
                mov bl, 4
                mul bl
                
                mov si,0
                add si,ax
                
                mov cx,4
                loop_for_clearing_cart:
                    
                    mov si[cart], 20h
                    
                    inc si
                    loop loop_for_clearing_cart
                
                mov ah,9
                lea dx, z
                int 21h
                
                jmp rider_choices  
            
         ;============================================================================================
         
         
         ;***********************************************************************************************************************************************************************      
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************     
         ;***********************************************************************************************************************************************************************        
               
         ;newline and carriage return code
         mov ah, 2  
         mov dl, 0ah
         int 21h
         mov dl, 0dh
         int 21h          
         ; end of newline and carriage return code
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H 
        
    MAIN ENDP
    END MAIN                   
