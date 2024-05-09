package Models;

/**
 *
 * @author ADMIN
 */
public class Product {

    private int pid;
    private String name;
    private String image;
    private double price;
    private String description;

    public Product() {
    }

    public Product(int pid, String name, String image, double price, String description) {
        this.pid = pid;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" + "pid=" + pid + ", name=" + name + ", image=" + image + ", price=" + price + ", description=" + description + '}';
    }

}
