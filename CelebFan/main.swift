//
//  main.swift
//  SwiftHappyLife
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

print("Welcome To HappyLifes")

var  bankDetails1 = Bank(organisationId: "bank1010" , bankName: "CIBC" , accountNo: "AC1234")
var  bankDetails2 = Bank(organisationId: "bank1011" , bankName: "CIBC" , accountNo: "AC1235")
var  bankDetails3 = Bank(organisationId: "bank1012" , bankName: "Scotia" , accountNo: "AC1266")
var  bankDetails4 = Bank(organisationId: "bank1013" , bankName: "Scotia" , accountNo: "AC12677")

var address1 = try Address(houseNo: "c142", streetName: "Queen St", city: "Brampton", country: "Canada", postalCode: "1466661")
var address2 = try Address(houseNo: "D7809", streetName: "King St", city: "Toronto", country: "Canada", postalCode: "343434")
var address3 = try Address(houseNo: "L979", streetName: "Ace St", city: "Toronto", country: "Canada", postalCode: "3445656")
var address4 = try Address(houseNo: "G393", streetName: "Main St", city: "Monteral", country: "Canada", postalCode: "678909")


var product1 =  Products(productID: "pro1", productName: "Cap",productType: ProductType.Clothes  )
var product2 =  Products(productID: "pro2", productName: "Shirt",productType: ProductType.Clothes )
var product3 =  Products(productID: "pro3", productName: "Bat",productType: ProductType.Others )
var product4 =  Products(productID: "pro4", productName: "Shoes",productType: ProductType.FootWare )
var product5 =  Products(productID: "pro5", productName: "Car",productType: ProductType.Automobiles )
var product6 =  Products(productID: "pro6", productName: "Bicycle",productType: ProductType.Automobiles )
var product7 =  Products(productID: "pro7", productName: "Mac",productType: ProductType.Miscelleneous )
var product8 =  Products(productID: "pro8", productName: "Iphone",productType: ProductType.Miscelleneous )
var product9 =  Products(productID: "pro9", productName: "Bag",productType: ProductType.Others )
var product10 =  Products(productID: "pro10", productName: "Sandles",productType: ProductType.FootWare )

Products.arrayProducts.append(product1)
Products.arrayProducts.append(product2)
Products.arrayProducts.append(product3)
Products.arrayProducts.append(product4)
Products.arrayProducts.append(product5)
Products.arrayProducts.append(product6)
Products.arrayProducts.append(product7)
Products.arrayProducts.append(product8)
Products.arrayProducts.append(product9)
Products.arrayProducts.append(product10)


var admin = Users(id: 451, firstName: "Admin", lastName: "admin", gender: Gender.Male, email: "admin@gmail.com", password: "123456")
Users.addUsers(user : admin)

var seller1 = Seller(id: 111, firstName: "Vipul", lastName: "Garg", gender: Gender.Male, email: "Vipul@gmail.com", password: "123456", userType: UserType.Seller, productList: [product1,product2], address: address1, bank: bankDetails1)
Users.addUsers(user : seller1)

var seller2 = Seller(id: 222, firstName: "Raj", lastName: "Kaur", gender: Gender.Female, email: "Raj@gmail.com", password: "000000", userType: UserType.Seller, productList: [product3,product4], address: address2, bank: bankDetails2)
Users.addUsers(user : seller2)

var seller3 = Seller(id: 333, firstName: "Shivani", lastName: "Dhiman", gender: Gender.Female, email: "Dhiman@gmail.com", password: "658847", userType: UserType.Seller, productList: [product5,product6], address: address3, bank: bankDetails3)

Users.addUsers(user : seller3)

var seller4 = Seller(id: 444, firstName: "Naina", lastName: "Khan", gender: Gender.Female, email: "NK@gmail.com", password: "452525", userType: UserType.Seller, productList: [product7,product8], address: address4, bank: bankDetails4)
Users.addUsers(user : seller4)

var buyer1 = Buyer(id: 555, firstName: "Kishore", lastName: "Narang", gender: Gender.Male, email: "Kishore@gmail.com", password: "1237778", userType: UserType.Buyer, productList: [product1], bankAccountEmail: "cibc123@gmail.com")
Users.addUsers(user : buyer1)

var buyer2 = Buyer(id: 666, firstName: "Tirlok", lastName: "Bhist", gender: Gender.Male, email: "Kishore@gmail.com", password: "123123", userType: UserType.Buyer, productList: [product2], bankAccountEmail: "cibc123@gmail.com")

Users.addUsers(user : buyer2)


//Products.sortProducts()

func exitFunction(){
    return
}

func enterEmail() -> String {
    let email = readLine()
    if email == "0"{
        exitFunction()
    }
    
    var returnVariable = ""
    if email?.isEmpty == false {
        let isValidEmail = email?.isVAlidEmail()
        if isValidEmail == true{
            returnVariable = email!
        }else{
            print("you enter invalid email \(String(describing: email))")
            print("Please Enter Email Again")
            return enterEmail()
        }
    }else{
        print("You haven't enter the email, please enter the email!")
        return enterEmail()
    }
    return returnVariable
}


func enterPassword() -> String {
    let pass = readLine()
    if pass == "0"{
        exitFunction()
    }
    
    if pass == "0"{
        exitFunction()
    }
    var returnVariable = ""
    if pass?.isEmpty == false {
        let isValidPass = pass?.sizeCheck()
        if isValidPass == true{
            returnVariable = pass!
        }else{
            print("Entered length is short")
            print("Please Enter Password Again")
            return enterPassword()
        }
    }else{
        print("You haven't entered password, please enter !")
        return enterPassword()
    }
    return returnVariable
}

func getUserOptions(user : Users)  {
    
    if user.userType == UserType.Admin{
        print("Admin Logged In")
        print("Press 1 to get all users")
        print("Press 2 to get all Sellers")
        print("Press 3 to get all Buyer")
        print("Press 4 to get all Products")
        print("Press 5 to Add new Seller")
        print("Press 6 to Add new Buyer")
        
        
        let inputvar = readLine()
        if inputvar == "0"{
            exitFunction()
        }
        
        switch inputvar {
        case "0":
            exitFunction()
        case "1":
            for item in Users.dictUsers{
                print("******************")
                item.value.Display()
            }
            getUserOptions(user: user)
        case "2":
            for item in Users.dictUsers{
                if item.value.userType == UserType.Seller{
                    print("******************")
                    item.value.Display()
                }
                
            }
            getUserOptions(user: user)
        case "3":
            for item in Users.dictUsers{
                if item.value.userType == UserType.Buyer{
                    print("******************")
                    let i = item.value as! Buyer
                    i.Display()
                }
            }
            getUserOptions(user: user)
        case "4":
            for item in Products.arrayProducts{
                item.Display()
            }
            //            Products.sortProducts()
            getUserOptions(user: user)
        case "5":
            print("Enter values to add new Seller")
            print("Enter id")
            guard let id = readLine() else { return }
            if id == "0"{
                exitFunction()
            }
            let vid = Int(id)
            print("Enter FirstName")
            guard let vfirstName = readLine() else { return }
            if vfirstName == "0"{
                exitFunction()
            }
            print("Enter lastName")
            guard let vlastName = readLine() else { return }
            if vlastName == "0"{
                exitFunction()
            }
            print("Enter gender")
            let vgender = readLine()
            if vgender == "0"{
                exitFunction()
            }
            var gender = Gender.Other
            
            if vgender?.lowercased() == "male"{
                gender = Gender.Male
            }else if vgender?.lowercased() == "female"{
                gender = Gender.Female
            }else{
                gender = Gender.Other
            }
            
            print("Enter Email")
            let vemail = enterEmail()
            print("Enter password")
            let vpassword = enterPassword()
            let vtype = UserType.Seller
            
            //                    print("Enter Bank Email Id")
            //                    let vbankEmail = enterEmail()
            //
            //                    print("Enter Bank Address")
            
            print("Enter house no")
            guard let vhouseNo = readLine() else { return }
            if vhouseNo == "0"{
                exitFunction()
            }
            print("Enter Street no")
            guard let vstreetName = readLine() else { return }
            if vstreetName == "0"{
                exitFunction()
            }
            print("Enter city")
            guard let vcity = readLine() else { return }
            if vcity == "0"{
                exitFunction()
            }
            print("Enter country")
            guard let vcountry = readLine() else { return }
            if vcountry == "0"{
                exitFunction()
            }
            print("Enter postalCode")
            guard let vpostalCode = readLine() else { return }
            if vpostalCode == "0"{
                exitFunction()
            }
            print("Enter Bank Details")
            print("Enter organistaion id")
            guard let vorganisationId = readLine() else { return }
            if vorganisationId == "0"{
                exitFunction()
            }
            
            print("Enter bank Name")
            guard let vbankName = readLine() else { return }
            if vbankName == "0"{
                exitFunction()
            }
            
            print("Enter account no")
            guard let vaccountNo = readLine() else { return }
            if vaccountNo == "0"{
                exitFunction()
            }
            
            let  vbankDetails = Bank(organisationId: vorganisationId , bankName: vbankName , accountNo: vaccountNo)
            
            var vaddress = Address()
            
            do{
                vaddress =  try Address(houseNo: vhouseNo , streetName: vstreetName , city: vcity, country: vcountry, postalCode: vpostalCode)
            } catch let error {
                print("Error: \(error)")
            }
            //
            //                    let vaddress =  try Address(houseNo: vhouseNo , streetName: vstreetName , city: vcity, country: vcountry, postalCode: vpostalCode)
            
            let b = Seller(id: vid!, firstName: vfirstName, lastName: vlastName, gender: gender, email: vemail, password: vpassword, userType: vtype, productList: [], address: vaddress , bank: vbankDetails)
            
            print("User has been added")
            Users.addUsers(user: b)
            
            getUserOptions(user: user)
            
        case "6":
            print("Enter values to add new buyer")
            print("Enter id")
            guard let id = readLine() else { return }
            if id == "0"{
                exitFunction()
            }
            
            let vid = Int(id)
            print("Enter FirstName")
            guard let vfirstName = readLine() else { return }
            if vfirstName == "0"{
                exitFunction()
            }
            
            print("Enter lastName")
            guard let vlastName = readLine() else { return }
            if vlastName == "0"{
                exitFunction()
            }
            
            print("Enter gender")
            let vgender = readLine()
            if vgender == "0"{
                exitFunction()
            }
            
            var gender = Gender.Other
            if vgender?.lowercased() == "male"{
                gender = Gender.Male
            }else if vgender?.lowercased() == "female"{
                gender = Gender.Female
            }else{
                gender = Gender.Other
            }
            
            print("Enter Email")
            let vemail = enterEmail()
            print("Enter Password")
            let vpassword = enterPassword()
            let vtype = UserType.Buyer
            
            print("Enter Bank Email Id")
            let vbankDetail = enterEmail()
            
            let b = Buyer(id: vid!, firstName: vfirstName, lastName: vlastName, gender: gender, email: vemail, password: vpassword, userType: vtype, bankAccountEmail: vbankDetail)
            print("user added")
            
            Users.addUsers(user: b)
            
            getUserOptions(user: user)
        default:
            print("Wrong input Please enter again")
            getUserOptions(user : user)
            
        }
        
    }else if user.userType == UserType.Buyer{
        print("Buyer Logged In")
        print("Press 1 to get all Products")
        print("Press 2 to buy a product")
        
        let inputvar = readLine()
        if inputvar == "0"{
            exitFunction()
        }
        
        switch inputvar {
        case "0":
            exitFunction()
        case "1":
            for item in Products.arrayProducts{
                item.Display()
            }
            getUserOptions(user: user)
        case "2":
            getUserOptions(user: user)
            for item in Products.arrayProducts{
                item.Display()
            }
            print("Eneter id of product you want to buy")
            guard let id = readLine() else { return }
            if id == "0"{
                exitFunction()
            }
            //                    let vid = Int(id)
            for item in Products.arrayProducts{
                if item.productsId == id {
                    user.arrayProducts.append(item)
                    print("product added")
                    item.Display()
                }
            }
            getUserOptions(user: user)
            
        default:
            print("Wrong input Please enter again")
            getUserOptions(user : user)
        }
        
    }else if user.userType == UserType.Seller{
        print("Seller Logged In")
        print("Press 1 to get all Products Added by you")
        print("Press 2 to add product")
        
        let inputvar = readLine()
        if inputvar == "0"{
            exitFunction()
        }
        
        switch inputvar {
        case "0":
            exitFunction()
        case "1":
            for item in Products.arrayProducts{
                item.Display()
                //                print("*********************************")
                //                print("product id :\(item.productsId)")
                //                print("product name :\(item.productsName)")
                //                print("product type:\(item.productsType)")
                
            }
            getUserOptions(user: user)
            
        case "2":
            print("add product")
            print("Enter Id")
            
            guard let id = readLine() else { return }
            if id == "0"{
                exitFunction()
            }
            
            print("Enter ProductName")
            guard let vproductName = readLine() else { return }
            if vproductName == "0"{
                exitFunction()
            }
            
            print("Enter product type")
            guard let vlastName = readLine() else { return }
            if vlastName == "0"{
                exitFunction()
            }
            
            let vproduct =  Products(productID: id , productName: vproductName, productType: ProductType.Miscelleneous )
            Products.arrayProducts.append(vproduct)
            
        default:
            print("Wrong input Please enter again")
            getUserOptions(user : user)
        }
    }
    
}

func passwordFunction(user: Users) {
    print("Please Enter Password")
    let passwordInput = readLine()
    if passwordInput == "0"{
        exitFunction()
    }
    
    if  passwordInput?.isEmpty != true {
        let isValidPass = passwordInput?.sizeCheck()
        if isValidPass == true{
            if passwordInput == user.password{
                print("You have sucessfully logged in!")
                getUserOptions(user: user)
            }else{
                print("your password did not match. please enter your password again")
                passwordFunction(user : user)
            }
        }else if isValidPass == false{
            print("You haven't entered correct length of password, please enter the password again!")
            passwordFunction(user : user)
        }else{
            print("You haven't enter the password, please enter the password!")
            passwordFunction(user : user)
        }
    }
}

func signInFunction(){
    print("Please Enter UserEmail")
    print("or Enter 0 to Exit")
    let emailInput = readLine()
    if emailInput == "0"{
        exitFunction()
    }
    if emailInput?.isEmpty == false {
        let isValidEmail = emailInput?.isVAlidEmail()
        if isValidEmail == true{
            let user = Users.findUser(email: emailInput!)
            print(user.email)
            if user.email != "" {
                print("you enter valid email \(String(describing: emailInput!))")
                passwordFunction(user : user)
            }else{
                print("User Doesnot Exist try with other email id")
                signInFunction()
            }
            
        }else{
            print("you enter invalid email \(String(describing: emailInput))")
            print("Please Enter Email Again")
            signInFunction()
        }
    }else{
        print("You haven't enter the email, please enter the email!")
        signInFunction()
    }
}

func signUpFunction(){
    
    print("Enter values")
    print("Enter id")
    guard let id = readLine() else { return }
    if id == "0"{
        exitFunction()
    }
    
    let vid = Int(id)
    print("Enter FirstName")
    guard let vfirstName = readLine() else { return }
    if vfirstName == "0"{
        exitFunction()
    }
    print("Enter lastName")
    guard let vlastName = readLine() else { return }
    if vlastName == "0"{
        exitFunction()
    }
    
    print("Enter gender")
    let vgender = readLine()
    if vgender == "0"{
        exitFunction()
    }
    
    var gender = Gender.Other
    if vgender?.lowercased() == "male"{
        gender = Gender.Male
    }else if vgender?.lowercased() == "female"{
        gender = Gender.Female
    }else{
        gender = Gender.Other
    }
    
    print("Enter Email")
    let vemail = enterEmail()
    print("Enter Password")
    let vpassword = enterPassword()
    let vtype = UserType.Buyer
    
    print("Enter Bank Email Id")
    let vbankDetail = enterEmail()
    
    let b = Buyer(id: vid!, firstName: vfirstName, lastName: vlastName, gender: gender, email: vemail, password: vpassword, userType: vtype, bankAccountEmail: vbankDetail)
    
    Users.addUsers(user: b)
    
    userInput()
    
}

func userInput(){
    
    print("Enter the UserEmail")
    print("Press 1 for SignIn")
    print("Press 2 for SignUp")
    print("or Enter 0 to Exit any where")
    
    let inputCode = readLine()
    if inputCode == "0"{
        exitFunction()
    }
    
    //    let inputCodeValue:String = inputCode!
    
    if inputCode == "0"{
        exitFunction()
    }else if inputCode == "1" {
        signInFunction()
    }else if inputCode == "2" {
        signUpFunction()
    }else{
        print("Invalid input Eneterd")
    }
}

userInput()


//func readJsonFileArray(jsonFileName: String)
//{
//    print("in json block")
//    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
//
//    guard let jsonData = url else{
//        return
//    }
//
//    guard let data = try? Data(contentsOf: jsonData) else {
//        return
//    }
//
//    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
//        return
//    }
//
//    print(json)
//
//    var userList = [String: Users]()
//    if let jsonArray = json as? [Any]
//    {
//        var user: Users!
//        for userObject in jsonArray
//        {
//            user = Users()
//            if let jsonDictionay =  userObject as? [String: Any]
//            {
//                if let email = jsonDictionay["email"] as? String
//                {
//                    print(email)
//                    user.email = email
//                }
//
//                if let username = jsonDictionay["username"] as? String
//                {
//                    print(username)
//                    user.firstName = username
//                }
//
//
//                if let password = jsonDictionay["password"] as? String
//                {
//                    print(password)
//                    user.password = password
//                }
//
//                userList[user.firstName] = user
//
//                //Read Company Dictionary
//            }
//
//
//        }
//
//        print(userList)
//        print(userList.count)
//
//
//    }
//
//    print(userList)
//
//    print(userList.count)
//}
//
//readJsonFileArray(jsonFileName: "userlist")
//}
