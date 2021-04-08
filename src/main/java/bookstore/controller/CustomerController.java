/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Category;
import bookstore.entity.Customer;
import bookstore.repo.CategoryRepo;
import bookstore.repo.CustomerRepo;
import bookstore.service.UserService;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

 

@RequestMapping("/customer")
@Controller
public class CustomerController {
    
@Autowired
CustomerRepo customerRepo;
    
 @Autowired
 UserService userService;

    
    @GetMapping
    public String customerAccount(Principal principal, Model model){
        Customer customer = customerRepo.findByUsername(principal.getName());
        
        model.addAttribute("customer", customer);
            
        return "customer-account";
    }
    
    @PostMapping
    public String updateCustomer(Customer customer, RedirectAttributes attributes){
        userService.saveCustomer(customer);
        
        String successMessage =customer.getFirstname()+" "+customer.getLastname()+" successfully updated!!";
        attributes.addFlashAttribute("successMessage", successMessage);
       
        return "redirect:/";
    }
}
