import com.ogani.entity.Order;
import com.ogani.entity.OrderDetail;
import com.ogani.entity.Product;
import com.ogani.helper.JPAUtil;
import com.ogani.service.OrderService;
import com.ogani.service.ProductService;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.groupingBy;

public class TestDataSource {

    private final OrderService orderService = new OrderService();
    private final ProductService productService = new ProductService();

    @Test
    public void test() {
        JPAUtil.getEntityManagerFactory();
    }


}
