package bookstore.controller;

import bookstore.entity.Book;
import bookstore.entity.Customer;
import bookstore.entity.Cart;
import bookstore.entity.Role;
import bookstore.repo.BookRepo;
import bookstore.repo.CustomerRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bookstore.repo.CartRepo;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/admin")
@Controller
public class AdminController {
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    CustomerRepo customerRepo;
    
    @Autowired
    CartRepo cartRepo;
    
    
    @GetMapping
    public String adminHome(){
        return "admin-home";
    }
    
    @GetMapping("/books")
    public String manageBooks(Model model){
    List<Book> books = bookRepo.findAll();
    
    model.addAttribute("listOfBooks", books);
        
    return "manage-books";
    }
    
    @GetMapping("/customers")
    public String showCustomers(Model model){
    List<Customer> customers = customerRepo.findAll();
    
    model.addAttribute("listOfCustomers", customers);
        
    return "manage-customers";
    }
    
    
    @GetMapping("/carts")
    public String showCarts(Model model){
    List<Cart> carts = cartRepo.findAll();
    
    model.addAttribute("listOfCarts", carts);
    
       carts.forEach(System.out::println);
        
    return "manage-carts";
    }
    
    @GetMapping("/customers/create")
    public String showCreateCustomerForm(@ModelAttribute("customerToEdit") Customer customer, BindingResult result){
        
        
        return "create-customer";
    }
    
    
    
    
    @GetMapping("/customers/delete")
    public String deleteCustomer(@RequestParam("id") int id, RedirectAttributes attributes){
        
        Customer customer = customerRepo.findById(id).get();
        
        String successMessage = "Customer "+ customer.getFirstname()+" "+customer.getLastname()+" successfully deleted!!";
        attributes.addFlashAttribute("successMessage", successMessage);
        
        customerRepo.deleteById(id);
        
        return "redirect:/admin/customers";
    }
    
    @GetMapping("/customers/update")
    public String showUpdateCustomerForm(@RequestParam("id") int id, Model model){
        
        Customer customer = customerRepo.findById(id).get();
        
        model.addAttribute("customerToEdit", customer);
        
        return "create-customer";
    }
 
    @PostMapping("/customers/update")
    public String updateCustomer(Customer customer, RedirectAttributes attributes){
        
        //Applying role to customer manually
        Role role = new Role(4);
        customer.setRole(role);
        
        System.out.println("Customer to be updated"+customer);
        
        customerRepo.save(customer);
        
        String successMessage = "Customer "+ customer.getFirstname()+" "+customer.getLastname()+" successfully updated!!";
        attributes.addFlashAttribute("successMessage", successMessage);
       
        return "redirect:/admin/customers";
    
    }
    
}
    

