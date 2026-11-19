Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093034;
	b=vk0fWtbxypIhRrih58IB4VjqLo4rrSR2YFb9VSLGauYIvbtBwP6asVqslvv7u/cIIgGw
	 U+gX6NVknaDe9QfulDeqq/Dvd0WYUuZk44UFLE8PpGa2ttwsEtqyiyiQwvIkDjcshvUht
	 Rt8Dw0SavdtPMlvuYIEcO77t/HYpURwNBbzPeG6GpGALiQU8O3ye9mwPECPhTfpo7x2UA
	 pVOGs19sIKn5lrK9ZUAex+ZkYF7pX2+K45sK7o6TVGhTNY5s1eO4Y7NjnRkiYe7hlaWjC
	 k72MTX3kWNHW36uOhwTQdQNIMLjktff+OXh8jog842nLtjrqzxpdr9iWK+iBZHraNPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
	b=Z/dq7iohu+WtpJP+PXuY78OlZl44t9XjBjBN7DU2u/p+y1oQKFXLLi7309TwpkT628h6
	 rMk+bZoTkGfpsXORl9uCCyoZMDLQOPXMsWXjqHl2RR+Lq+mxI62K/zD7dg2C8ya/yOZJ5
	 A4RPHEW7q6j+2TKJr0zupiM3cffxeC9Zznk8Lf+fc04D17TNpVotus9MpxPkfrOODT+G3
	 d+IeHLQOWdZLd6Wgv+gNmFI/ytYHG3y+AqVrNjff8U/C0XauLhwDh/5+MK4Dq5vhHhdaG
	 Xv208CKQImGgxZAHHAYHl2VjP1MKqD27FHwwA7AOlFX+lzbOBUZKH2bqrBSOdt/h1hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J96yC7DS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE5360A2604
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE5360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J96yC7DS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjx7F3583624
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=; b=ZRGivuQ1oWWQGCRi
	sCfEA/ppJkCsTOqCJL+s41gZI1kLSsJDxN9jfB8tC2tt3E+l2SBcZbDTRAQ2Nt5v
	ZOPtBlcVekwMteKFgFVUK/aHwbfkqAqOWSJq7J7uXF4eNAEaU6HXNM4pwrmBb46y
	o3lc1NqC2KrfxfSB5wILQ2xVlMZGwgnlzlphznYFAUi35fDj1icARv5quHfbj2cK
	Z8H8HbTsxJGGs6NVR8Evjyrb8lijApNynaAkgQxY4lkm2/R0B63ZOeg8wwXdfSnW
	0RqbJ2GYL2qrvF35pLsEyIjKx4Jf4CyUgfYNZO9JBSsjkQDHVrBFjAfDBk2EBOWs
	yfC7Gg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymgmbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2420063eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 04:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093032; x=1795697832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=J96yC7DS//5V6PtICWu1L5GlNCDE9QG10CJHsDdE1OrNjqkAvbJVx2Z9BSoVhBZCuq
         FN4GQQgbURpL88+Ce8rLLhQto0C3gc+w4vRHQZmTZrwMICaOjFTZtZL1o/x6bcTBqT//
         lziqbsWFFUFCuAvCtuoob3PsSA8gHo6025sHf+2/SfenR2qH/qu17xDdEP6aTnF8sfDC
         9iJ2JPpG+cGkOjpUbg6aFYtgI7a3kKpn36puci+bg9EwiluUeGngIJNiMS9PwudFdkGf
         RGADE5V+vY9u7GtcW+RdrkGDblwnNjNeVqT3VmOAdWfRKuneq9Wmmv/dRec3M0WscJsT
         pTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093032; x=1795697832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=KLH3zcPt+qq2vIF0p5a+Ru9geTxcjNRJZNEhNYvrI0gy5isB29y3H8GiALOTmys++Z
         WlcDBYdD0PH3Bl2+ltwkvWVBVfsfX3ShSby0JcbiiT+5oBvjZXvY2yd/ZLfD+E9RtomJ
         YTDDRb6mPijJ54ylgadLtRFg/dTa4jllLFFT7aFExMOdcrjnIcp5K9tHkkl7JN3Ep/qH
         nAfY8QY7YJp0Ua63XWW5fVwVB+h2QXZPTJrVSITpQAWk3cq9cfbary/D2yg9Lj9GYDCX
         4NUDJs1iGpXN5LXD/AZQHX17qPRC0RQ+slY9QkFDfiHhwZj71na3l1C3DIilsNHxUP2/
         erJw==
X-Forwarded-Encrypted: i=1; AL+hErExb0/FrpY/l5dzs5wHApbAwSr4anhL3NV5efWgKfMOBUPTdV/olqYpvKQpmoniapaSIEccRY0wGXlA4M4Frw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PP7oW8nd7Ctus0Q7je9NVjTTOhszaax4et1WJcFqcO9J3fP6W
	ircnDbI6RFWBXsgp2sP62u/mqrWw8eSa64TVNHZnUowQpYDDXW8HihhnNk/lrJkyT9xUxgpwKH7
	lBR2ttDmL9a1B4YXyPgO0LIpCS/O8+OsFZ1P44fIgw47InqApqwIqK3WgOWSKLFlxp/pITg==
X-Gm-Gg: AZFdTZfydRFuMwIXhV/NnfF/th8uGeYDtnYPsHa3X1zzvjOqIsZItlaFe6K474b7mfK
	0GA2uqOMcRLJtbpJ9y5fNO5lLpr34u0JquFrbnQyXN/DSvMucHWzGI/xY8UMcHvoeHcRWYP2lm7
	JuHVPuBiB12Id7Gn0JPKbL9oBoEaxOxn8Mo4xwAGt4khRxX9yiKObCYiAHXij7zAGrqWlwnizXN
	RgbjOTj9bfT7QLKDu4hfVvCxDZOl47RgwGx2i28E2ieomU+yzjn5uC/rD7VGpAV5dxLtT/yqR/t
	iJ9UqO+I/hDCwO+OvjXk8mAlJnG5FSmAx8tfQSn1mIx+kza03oZuZBNuBrCsxv1+0DYm4nQkht/
	TOY5POReQ8UYwHzJ7BFJeP3LkheonlPXol101LwsaKP9A26mRDMdKPSs6m7RK+teqOCeqxU6/wC
	Ax0inbvqxq
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032279eec.13.1795093031714;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032235eec.13.1795093031084;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:10 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:35 +0530
Subject: [PATCH v6 3/7] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-3-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1780;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0zEUl2S9sKA63T0Lpy4WWFHatcVllvfZJQrn5ZSlMz0=;
 b=QiPOhPdWYBohHyIwt2tF1rwyCA1O/3J19GBbfxfpRGsrmthwLR54jYh7vJieyTmuzer/m6ZUK
 +J7M4UBSalZDTdbAAM9bOcqLpdX402IQeObndCBqPYoPYTjrhrq7CX5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX5mVk52oIo3hG
 3mQsO3y5xyMoomBNbJhnOvdbP2sR/Choqr4WgndMj2lQM4I0lkgplkk4hRjTbEXRqrrdH31cnol
 GrOfNdImSOnHwPU1UaqBhscKicoN9Yc=
X-Proofpoint-GUID: 2tXugXkLrvvdMIBZnZu6ocvAE540pygp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX7VFF2yS3EGN/
 +W09GTk3CV5RO2lrYXxYj2UHoLvtw4WlWUHmeea//hSwJzvGlmoeBjlWQkkmW8vMhjcAVtZgbD8
 Lb6yzsiTuNV/E1d6jFvYcS58ykD4s/EgFfK32GgoWVKlzJCqW1Xs8QGwwDfjzjqv4+l+Hem2Bbf
 5cxFH+b2pABM8KDXSktkaNXDuLlS5yQtFMB73jTMpCD95U5j2OyAnDJqufQ6clQVekBH1An4QrR
 Dxj+M75V0AXbqNv3Qvzl2pSQePbROTBaL+EZh9lGKLmuNmRwd0skSs9LW8Do29sv0g8N6Akzbpl
 76nmEGh9K7kh92Xs3PFXjQ3HY0rLwfE4L9fMQNHzaNCVUOAcV4zpkGI8jkV1WRAg2os0U0AmWKx
 TOPGeo1I3pdzTL0XkFtCIlmCYTp/c+JX2RIrYDENvoNilQqgF6FkwPGJCV95JjARjJJiHk7KzQq
 yAV6LAi8cP6gzTGEb7A==
X-Proofpoint-ORIG-GUID: 2tXugXkLrvvdMIBZnZu6ocvAE540pygp
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afef228 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 15 +++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..a89955617bec 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6056,6 +6056,21 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_bandwidth_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
+ * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for 2.5 GT/s - 32 GT/s)
+ *
+ * Convert the Target Link Speed (TLS) field value from the Link Control 2 register
+ * to the corresponding enum pci_bus_speed.
+ *
+ * Return: pci_bus_speed corresponding to the TLS value
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 352079393edb..d12875c95491 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1739,6 +1739,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1

