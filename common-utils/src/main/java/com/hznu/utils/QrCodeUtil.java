package com.hznu.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * 二维码生成工具
 *
 * @author hanbing
 */
public class QrCodeUtil {

    public static String getBase64QRCode(String content)
            throws Exception {
        MultiFormatWriter multiFormatWriter = new MultiFormatWriter();

        Map<EncodeHintType, Object> hints = new HashMap<>(2);

        //设置二维码四周白色区域的大小

        hints.put(EncodeHintType.MARGIN, 1);
        //设置二维码的容错性
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        //画二维码
        BitMatrix bitMatrix = multiFormatWriter.encode(content, BarcodeFormat.QR_CODE, 400, 400, hints);
        BufferedImage image = MatrixToImageWriter.toBufferedImage(bitMatrix);

        //注意此处拿到字节数据
        byte[] bytes = imageToBytes(image, "png");
        //Base64编码
        return Base64.getEncoder().encodeToString(bytes);
    }

    private static byte[] imageToBytes(BufferedImage image, String type) throws IOException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();


        ImageIO.write(image, type, bos);
        return bos.toByteArray();
    }
}
