package bookstore.controller;

import bookstore.entity.Bookdetails;
import bookstore.entity.Cartitem;
import bookstore.service.StripeService;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Value("${STRIPE_PUBLIC_KEY}")
    private String API_PUBLIC_KEY;

    @Autowired
    StripeService stripeService;

    public PaymentController(StripeService stripeService) {
        this.stripeService = stripeService;
    }

    @GetMapping
    public String showchargePage(Model model, HttpSession session) {

        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");
        
        
        int amount = 0;
        
        for (Cartitem item : cart) {
        
                
            
                amount += item.getBookdetails().getPrice();
            
        }

        System.out.println(">>>Amount to be payed: "+ amount);
        
        
        model.addAttribute("stripePublicKey", API_PUBLIC_KEY);
        model.addAttribute("amount", amount * 100);

        System.out.println(">>>>Sending API PUBLIC KEY to JSP: " + API_PUBLIC_KEY);
        
        return "charge";
    }

    @PostMapping
    public String createCharge(@RequestParam String email, String token, String amount, RedirectAttributes redirectAttributes) {
        
        int totalamount = Integer.parseInt(amount);
        String stripeCustomerID = stripeService.createCustomer(email, token);

        
        String chargeId = stripeService.createCharge(email, totalamount, stripeCustomerID);
        
        System.out.println("email: " + email + " Token: " + token);

        if (token == null) {
            redirectAttributes.addAttribute("message",  "Stripe payment token is missing. please try again later.");
        }

        if (chargeId == null) {
            redirectAttributes.addAttribute("message",  "An error accurred while trying to charge.");
        }
        
        
        
        // You may want to store charge id along with order information
        redirectAttributes.addAttribute("message", "Success your charge id is " + chargeId);
        
        return "redirect:/";
    }
}
