Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093045;
	b=K120V4aG/GV3GgZ28Gxq8L8kVobdGvpTeOENLIShHeU9GZnjRNh2iDG/lc0Bs0GipPfD
	 oaQOvqVk9EVb5pAFQNz72ndBnjuXH/nti8TJLEeoJgqj8krX+KnyO37YMzPv/F0YJ0sCk
	 Up0sxr7AHCnv2Aku0dsoIRz/iAyGkn8FWFeMf90q4SZDpwhFB23sfnRqEhfAtjdcl+WHJ
	 OXzo0bB1caBf/JGVU299JexBNe215+/gY+w22abVo2TOOCzjK0u3BFcKqUemmEIJ96Onx
	 b15ntAo3ZDI32MvRxRGjjMnDhK2FO1T5nYSmY1or4FORWpfZnieNgtOvZlYiaQRQizw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=;
	b=ZATAajUJNcMxtS183PJX4GZvPUx5EyUBI5EBAgClse4JzEhPD8AbxeUbe4PXcpvPqgJS
	 TzsBEQTrVLIJSlrqosLElglTl/aMDOb34t5LZ+BDpyW4GHmE2pYaYJ30DPLSEqkyf/k3K
	 f7sn9xfA3PuVkzTOtqqnv3aTk7lgY2PeYIT6Kye9S7zn42PD+XzGAG+Ls3q2o4OeCDNKw
	 fID0r7RXrevKfQT5DZHiou+e/4uGK9EoLphxVkZYfGh3TN38zYdVsojyDRW/vHrWuUFTe
	 Wp9lPEA81NM7bx1UYpK+7szH9LxI0kI7RtnH97oVF4aW6turCvjVIOMiMnmGDBGkwrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2RrgOvV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N3PQwmTW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3D960A2616
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3D960A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2RrgOvV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N3PQwmTW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJCtne42371634
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=; b=T2RrgOvVuOTW9t82
	RDghEz4T/OgQ2GDeQg2fFnuDa2QeN+pVEUS/iCeCoaaprHAGyfDbtMQJ2jPkHUir
	Tkiv3HArF9zA2KrU7fVHpybkD2ccg186XxOnk44LldeaXvzyZ0vHEmFgtXnzC37g
	J+Fmxb0Q4YWkS1edChI7+LpyyhMe2fBi3zkmBx+fPKmmqFREu6iWjc+ddjstIQoq
	O9LKPKTrfU8C+8mBmdcKDdbYo7mK6BkvSvW6+Id9LTjEIIWKJOw3RiBc/ylOmyrO
	fTKnXJcdQ5qB/3lka0v8rM1uSdQjvGLjU8tVY6mwOkAV/U7M0QfLknB6pd2NZp10
	ia51QA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9kt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:57:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso2884396eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 04:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093043; x=1795697843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=;
        b=N3PQwmTWFdZtfArUmk5ncvQ1Nf0YrMjNiOk8JjqoWesshltU64E/z1wmZi4sDD5GWu
         0CCXwrrq4Lo7wbr4EP8Z8thqBxCj6c7NHpRC/hFEW+tvX/vR/ytlgMpdS/N3GfIBUvGP
         gplzayWq1GvVzLyENJV5XZli6aZOOmoCmsPkjrWxtgz/Q//DpF0KUGdEZGTZr/CZ/8OH
         wmwjreQZdNO6uUKnCYIi92tYLBgGcR2CweSgEVNEAGw90z42cnb5OOiMGhADddPsQZ3s
         Q1dNh2wQmhqtG7OmHKF5HJtq3H/uFHT4f5KxtE5vpWqh+nFVzwZp96rMox3LlKKBNrYK
         lsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093043; x=1795697843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=;
        b=DarO6a4Jf7+7JP6W6LIAdlcBgqfq2wuvxCzRxHY20osV2vilK02xNScFiz0//EVyWm
         qT3mu0FvT6wz7ivbC84VINAiETAFWFGmKGQNEHCKC3kbS9+ICzub+R/s74dQY3W2TOmi
         R2PWYvMDZx+dMPKm5/ah/zoY3cmL5IsvJnvYLHeTd2YSQs9BCvpoD8ea1IJNUPbuRyDD
         Mr41rF34UzelN4+GE6Vfdu81algXjKJ4m7/c1Szr+Jz9FCuDVMdwppTsrXBcb7nTUNeO
         NQoqM1LRmPktMC8L6FFw+tTbAiC9jzHWqBpx3z65qi6FA3zWMHaw1BuBGP3FWVYRE+4K
         pN0Q==
X-Forwarded-Encrypted: i=1; AL+hErF+XxghMvJ+Xi12L6KzAKQFJt+moxmL8zHa2a2TfH/RVBIrmBcaYl54x0zoVAKTwLbsbIO9afKgz2fpaENX3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eZrcKTFLwg5aOITPKRWDF58OMGKAdJiSez4U8IRAfKSWXXiSE
	8U7Aa3lxnc74m8iLCWvaBfFtN2qv4pWARdVvdF7sPUIJcWF9NADBippbut5k1lx5hxQnW8sl2lv
	fXi/gdQ55pwohdPQsu9eH1eopFfZgyGAnRbi1tufgnYrLPf1K1CjHS1ryCnrGluIkPqwI5Q==
X-Gm-Gg: AZFdTZdlWi2N+JOoVwS4pYhepwUj73IlJxHq5mpCXH0vVA95q4R2GQLN8GAw5NLgOFM
	WWeWw9WbsJ28H06CegXAoSX/N7l1gW+Psd/ZS+oy9tgVMglNCMndPU5B9onCeHjEIbF7GstL0ef
	A1umBrF63ZLXiOQ70wLL6SXb106oIo1o/teP5dGcSzEqEf12vmLXeG0tbsBSS1jsaAIchPIYlHu
	Cy/Fjn18nuFLIH+DqVijYXwgVwxE6Bq9dhhG3moLAVRlccrxPzc7F1IglTwZIyUqXNGBiqNqEDh
	Aiz3Oxv7qqsEfBk3Tp+jOW7o5gx0sWs71YvaBwQwJsxk0ZTDseAhhvbNAyqDmJAWV31PPml7FJB
	b1fPbCKiFFfQPG6WCSLD38WvhC4V32dfnbDJZ76D93YQ4DLWWhee/J/f1dXqMBJ5aBJHkNtl031
	uiOCGgOWL2
X-Received: by 2002:a05:7301:4704:b0:385:1099:3c35 with SMTP id 5a478bee46e88-38510993d02mr276460eec.6.1795093042834;
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
X-Received: by 2002:a05:7301:4704:b0:385:1099:3c35 with SMTP id 5a478bee46e88-38510993d02mr276420eec.6.1795093042295;
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:37 +0530
Subject: [PATCH v6 5/7] wifi: ath11k: Add support for MHI bandwidth scaling
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
Message-Id: <20261119-bwscale-v6-5-9a9a715fcb46@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=2825;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=00qFRlBmsgrZNkzmQzVjR73weDySzBF2Lznxsr3nfCw=;
 b=eW8KJul8rlT/Nq7A3LzC4zMCz5ZGXtbeojL0vF4Mp+zKbic1EFw/5W1/iOI5YZykazkzrIuFn
 H0n/2H+BN9kBkMCsNA/TntLydE3c0n6AosN5s9QJAgvUFxAD+TgcoHJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Vu1au0_esghvMlHrAi9-EaqE22hBW4_b
X-Proofpoint-GUID: Vu1au0_esghvMlHrAi9-EaqE22hBW4_b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX6vgNOCiH9ecZ
 8YObhrkDbslJoRSknCEw2PSWEX5323zwyEwDlHFi4oNfqZA3gd+YDu9HdyjSBWAB7IKzIXEq1pz
 XKDxgmln1qLwXZ+s27nAKrUrSC/st7o=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afef234 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7uZxxMFRC7_hs3sx8zEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX1Oj9ZaK/vvkF
 VnW7P2hcATxNwIE729ocN8hhSSjSSlWjzVUt2HfLyiqwHQNJonTyDnYBsviq02sARMBzjdzjVgD
 zDT0b0JkJ54dUdJQ1pP9lYRe80TTygdS4M6IqELsz22G+4Kg7v6QDhTEgpCJRh8qPS7GLL2WA/z
 gaTU/K6j/m/02nREtPHLODuYFH3SWvkgA9TtABNleVImNtsArS5MqnzospoknW1ZwY65z52kr4M
 04wZK2q7jWPyyHMpCZLEPmwur9gbcA383vo1aB6eAD6wj/JrDzjUb+IUqPEH+77OR1STg4WjM7A
 xo+DNSSdCGciJpukT8vaebNIJYzlMlOoin2zsYuZS+xXTFXv8Gf0QVSbRmNAkdncrg+WJanfqHn
 bC48CsaElyMs8/KAneCikPkTzhudEVC5yM6QPSMqD6mURX0GVWd5SYGGkixiGzCRrTaINCBPjkR
 ZuqfMuaYF0GQQx5VINQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

From: Miaoqing Pan <quic_miaoqing@quicinc.com>

Add support for MHI bandwidth scaling, which will reduce power consumption
if WLAN operates with lower bandwidth. This feature is only enabled for
QCA6390.

Bandwidth scaling is initiated by the endpoint firmware based upon the
bandwidth requirements, if there is high bandwidth data endpoint requests
for higher data rates or if there is less bandwidth they request for lower
data rates to reduce power. Endpoint initiates this through MHI protocol.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index a6c9ff112c68..65637fba92d1 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -20,6 +20,7 @@
 #define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
 #define MHI_CB_INVALID	0xff
+#define MHI_BW_SCALE_CHAN_DB 126
 
 static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
@@ -71,6 +72,18 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
 		.client_managed = false,
 		.offload_channel = false,
 	},
+	{
+		.num_elements = 8,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_BW_SCALE,
+		.doorbell = MHI_BW_SCALE_CHAN_DB,
+		.priority = 2,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
 };
 
 static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
@@ -311,6 +324,21 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
+				  struct mhi_link_info *link_info)
+{
+	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
+	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
+	struct pci_dev *pdev;
+
+	pdev = pci_upstream_bridge(pci_dev);
+	if (!pdev)
+		return -ENODEV;
+
+	return pcie_set_target_speed(pdev, speed, true);
+}
+
 static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
 {
 	struct device_node *np;
@@ -387,6 +415,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
 
 	switch (ab->hw_rev) {
 	case ATH11K_HW_QCN9074_HW10:

-- 
2.34.1

