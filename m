Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989802;
	b=2cQm2EXvW/Xn7cqWEXlH6I63jLu+yOITaMWHRUxse4Yt2ebj4JRzMPZ59dHzzouzYPxr
	 gi3B8J7CKAgUx67gVEwiFYrvH5Bt4r+EKsHmuowHACdbdLjGiTsJ+C4Nw5uscNKMmzxXz
	 myI0zyp+J8Ap/Oj5iEsZEwPSyycIRZZoIJNM/lVD9qsguwwSDsO1pwCBVp6iTcGVOTgkt
	 HGIeCAMu7AHHpO6YL2XhWMcEPftMufRbRzZZQoKsNqPcqIWw+HXeQca93oZbLk8nQqftd
	 YaeDTAhmWoPMdYYJUVebxZ3A4t84YX6R1OofIsv/dlnueEWkIaCfWgDk9RcEznNSJnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=4ANLTxB82JSdqEK0YyYz2Xopz2FBPNOnHzf2xY0HdA+4fNv4M3KkrBIO8eCyuf7r9rYm
	 zP35UGh1o5I6zCU+q+e928GsdRRbCh99xLxLtj2xCmulfTzfzj6lue8wM3NfHn1WfNmAj
	 3VbgdbnzIZPdY3HTltfwk55qVRQ3YspS5Doi4i8MwQF5/bdbNqJ+ygJ2xIRNmd6rx735H
	 zjJJs8xjc+jseEb8Rq8Sz0Ggxt3Kb2RLgdE/TfAofzaNKJ3BAi6Kqu7IHx7wtT2DVL14Y
	 Vfv7m0VefqlOEtpo1bC1snfRLgmrqwIOiQ3LqGttTBNixX2qAcmioFreFAHUrdJXGtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpVrs0Bh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7cgadLv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E182606A897
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E182606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpVrs0Bh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g7cgadLv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ux3q2453598
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=FpVrs0Bha0w/0rn0
	aXJhKN/JmYwXtN/rPG/vJzue0PU8ZxPmj6NBMtxe4mUsnR8BnqGKZvU9kR1FZVhc
	qtTYZwuc0NDyeaJJ0HeKlg1WS1OitJdRQ3h2vfXeaM9bO/8gqdOJ5z/Nv8sP6fut
	QKa0CmmZbO3qEecQkqbdhQmyOYcr9s6mrguRhpIRd0uSaELLDPOlOTHBLbatd0/Y
	Zq8HYZeNB3LXxIBWfeFDRWXKVMOl/+kCHaTPAA4TGHN0aUKo6IkhR8WxsUO+JoIp
	LtzOPwErN33XFku0tzlH8qXUO9ALcwXp9RB49c1qGAAN8SOOVtCzE1G7ldvZg0lS
	tQsT1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99yd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:16:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed05900df7so6476575ad.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989799; x=1795594599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=g7cgadLvBGI6/krNsIgWiFHJctVowT5rcZw3dPk7GWkaY/f1TqaOJAFkrIeCbckGLj
         wbqCLA6TmsTq1NEIDYnDCzAOwHFUdw8MWqJMGcF89VzSZ84tEUDCrGbcSLazpnBRuHEd
         6Q/Xwtkmzy9DkkxiNPtcjaUaZAjPXlXoJag65Lne1lztZtjSoheH8N5aTRcuSEgPh7Pq
         FXwQxUpcCQeCvyzXfm5cx58VdOvN/iga+8ShJ2Cq1TbXBbSLEIcYW19/un8PGc+5UNAj
         sv8NxGl9fo54fc/oquBM1K/yUT6H+uL42CNq0iHe3AplcDHTbaBFVxD3ypS3jux9TR8Q
         H2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989799; x=1795594599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=hUTwWkJVtlRwOwyL9uFiEOEoSITGWXSxBZzMGEf0jtIGZFKwL0nGCEgbfm0LCNI4Mo
         vojr4/U+xWI1hNDieWgT2pHZ0ahFVh0vR1AgBKzgBat1M/Dx0AtqFBEU0+fDBJUxEFjR
         ExNp9jcYpUdguWCnVNgFQG7v99Zz2Usu/V4FXn818mlBz5OSv/fSYho0jB5jYOcAefkA
         zQWLdGxlGH61uKt5RR1aD/QfRv4g9MPbPx/jZx69EHieROL8NZ3PV4e6i+SKvuwa3Sxo
         cc/v5fFgxAJNOzY1kwdttD3lcNyVrNP/ZyLsV4UeXcbBhRO0Kr1eru2sAyqx11GIEe8r
         Tz8A==
X-Gm-Message-State: APuU4Z9IsipwrEp7ptfwOncffBANAJk6EAaUGU2sIbQphUe14SgrOy9l
	uv2hIe5EgaUdrrNR1ub4EcmJ8AOZ9+ejCAwiw66Uue3gLKULF88UqxlIymCI/k1MPWN3kFixpDb
	3a3TEQCGVCAOtEzLe9YdIqShFdepujzx5S9uZQ4x7RNTv30lKQvSX57p+FtLqpSloI7G8jUNzk/
	OErA==
X-Gm-Gg: AZFdTZe4R1YVCHP6Wy9MWFm80xmtDa2gCSVa3vrdrz/eL5iKRs8SoLaY0xJVwFN6Asx
	sp0/9Eb4kZOYh/MncngKgjKm5uxIkVWkhImjXds6syCfDOhGKpUjwtd/SH2mgeaRRNEWn4uyv6N
	edUBgRmwDaHE0EAEgE1jNtlTepUMnkRSukak5Ekf6s+hcG5zqUYsCbKgpsiPZX/+MMVrKr1za67
	3IyMh1ul9BbXl2IjNt60Fopaota7TvA4FCmtWonZXv9vfr3Z8+hykkow3CK/Ixc4iEMR6Bm4PWc
	tcBHfc/Zmc4AB/qzAZymuQxg5IKMev9QoVOMi3jQ5PUWXojg4dYvn2Zqi8dPhSIBYCW04WTVS4u
	UGvRBpaKVrZZiQiiyR6QSbtMRqtV3PzOWXzEYMbqNpJyL9lvw8H1ZRoipEsP3Z92NlO1eIvzKdB
	QUujVSFcVKviEM2pCsDVGSz+eEMTw41UOwsUEougy5YnMFBiql4sigbiFjBpAKln0bpGQjbIF1W
	g==
X-Received: by 2002:a17:90b:1c8b:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b3d07a92ffmr1922928a91.49.1794989799345;
        Wed, 18 Nov 2026 00:16:39 -0800 (PST)
X-Received: by 2002:a17:90b:1c8b:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b3d07a92ffmr1922910a91.49.1794989798904;
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:36 +0530
Subject: [PATCH ath-next v3 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-13-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXwG7ilCQyJw36
 dgC9w/P1E5vEtYi7ieilVwoW0jngb7o6VD2FZGSjMpxMAc4tboZaJslqYKM6YRiZLmncycYGicz
 vU2nXFBeKd9POxPeCcEOmDzvqhaxYE8=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5ee8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX09Mp5/UDs34c
 Ieb4DuFQ3dfzfJTHmJVY2FU2gdnR64McRUuQna78DaVQTaK2IKqJiL6LekeGMzZKXgpWbiEDgJ6
 79uWb3An1DvcsebIPI4zvDZQlruz+bu8IGlE1vlV967mBZ/SjqrLEd/XKQflc0joJxMtbmAoDzg
 5Rm1GmTVeuPYaGJQLZitEPCCwyrfzd9mwqwMLFZUbRA7/1HrJnl0PGAuJ/+IKV5ipvDY6uWxk1C
 tiYrBagQT3WZig+PxNluTdbLahxrWaCaOCYDGJEj1aBsW8MDlkgAG9LBv35av8DMUgvPm5xlPCP
 PDowUeRcixFQ6TRkGoLeGM7qZgdWxLZwWa/BOVJgWXx2leOTPvgBeSMxEcOr0brqfiE9hB+opDo
 kpGYFRmI4WhAJrH/WonknQrfhuSzAtEaV9wN6NIZxjShVr3obJqU7Xn7mIZmsd68Nyj4sjgsi8G
 cHl2GgncEpl6rZKMMwQ==
X-Proofpoint-ORIG-GUID: NRHm__Rfxi2Cm-yyoEtrRujzsdkFvBfE
X-Proofpoint-GUID: NRHm__Rfxi2Cm-yyoEtrRujzsdkFvBfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

