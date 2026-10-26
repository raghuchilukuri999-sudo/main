public class This2 {
    
    // Variables
    public Integer fees;
    public Integer discount;
    public Integer percentageOfMarks;

    // Method to calculate discount based on percentage of marks
    public Integer getDiscount(Integer percentageOfMarks) {
        this.percentageOfMarks = percentageOfMarks;

        // Determine discount based on percentage of marks
        if (this.percentageOfMarks >= 90 && this.percentageOfMarks <= 100) {
            this.discount = 90;  
        } else if (this.percentageOfMarks >= 80 && this.percentageOfMarks < 90) {
            this.discount = 80;
        } else {
            this.discount = 60;
        }
        
        return this.discount;
    }
    
    // Method to calculate fees after discount
    public Integer getFeesAfterDiscount(Integer fees, Integer percentageOfMarks) {
        this.fees = fees;

        // Calculate discount using the getDiscount method
        Integer discountPercentage = this.getDiscount(percentageOfMarks);//using the 1st method in the 2nd method by using this keyword

        // Calculate fees after applying the discount
        Integer feesAfterDiscount = fees - (fees * discountPercentage / 100);
        return feesAfterDiscount;
    }
}