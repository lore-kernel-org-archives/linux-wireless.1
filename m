Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571074;
	b=5I7S8TMVBtbHGJtTgqhQtokDqD/bhMhtbi4FJ0iDIDHrrua7HP786u0DdCTC6R7GH3gy
	 Jx3MhI2kjTH9TUWEpeoFvkWH63093LMab7GFrjzgbVPurtvHHIGgvwIGpRka9LexbQG1i
	 enhQCdWFok4EFvhDQU0Y+k1m+UqwdTJqSCJqBn6uwTHJXE0qihw9zVxd97htYXpPrJ+Ue
	 nYU9bqpybN7ImdI5Vs1hWzCQ/kjvq4qQj65RyjhrSfl0156YVkdT7+GywhNWgIKtN+g7x
	 abU6GDKzAbKQ+75N9IPcED7HWH2jA5Rrb0TliM4/mTJUoVgIGFo2S4wDBjKdz1mMAOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kGQETZ/T+amttlTIZ7lR9ey6wrw1motDP5sTzBHtntc=;
	b=d8Witf7rgoKiPcfJO9rA9YO3bYMCpzYSNKKI+F8++cqci8ePeddnCxydIjzYCjqbs+hD
	 oobz/+Mn5iT5Y5UPdLNTQcZtqR+YY2XHbj8FeYoP8CfMbgrWdMzYs0s5s/cwiuovlgen6
	 xdWqXCDIYC58+YvYry/Y/db5HmOPGeE6nh7o/CGm1tn+artr8ZBFP07yK6uFqM1+HBOkP
	 tBJ0lY5DkICKfwp08G1NeVJoiYqwDYmCPY8xFP4Y1jTwydojodGrlTeChpmEaDQ+A0B4Y
	 vb78Lemh2vsJIamaJhAUi5qgP1Jp434p8Y+oxYwOnp2t5fzr02jdKWCz9VDn4YDoYyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RsGQIwR3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBJS5hAg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBF3606A329
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 01:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EBF3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RsGQIwR3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBJS5hAg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMalWt640319
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 01:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kGQETZ/T+amttlTIZ7lR9e
	y6wrw1motDP5sTzBHtntc=; b=RsGQIwR3CT1orfEWTUB/372SK0QoRXrwXUFSfo
	bkhwEjvtB0Pgqfgct5ZHjme005gpYiE1CciGJN+JIs5R0OajOloJNb5XIm1l4bbv
	Py2/3M+NRvGt3QmNluz9HF78ElaSxJHVy6jtpsDRn9cj2nEb15sULUGvYPzxdXgW
	ZNlQVmMwWcrF+wHFeH/SL+Sv+4tHzetKU8fDeoOTJ0BDCFNfz1o69/g3vGQ82Pf8
	SBzY2fzF98pBwwYSwKqIT5xJN925gtOigYowx6Gf4if5Hlx9lkTMXHDQehz6OSH5
	ZGVRKbo+y959P0F/pMNgSB1WYVnwJZDCKdS06XF4tGJRbK1g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effsvd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 01:44:32 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso5424325c88.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795571071; x=1796175871; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kGQETZ/T+amttlTIZ7lR9ey6wrw1motDP5sTzBHtntc=;
        b=RBJS5hAgpvaX6m/sXXNohccBkQnmiiyy+QWduL1jVZiESlB53Ha1eWsp0eS71nnYoC
         7gfqAQ1OyMnhDuOtmcYyLQqilX4ovzpb543wEC3VfwJRh/q2xVq2Yf1s612Ctq7kZbn/
         rrAwKzbFrVL6WAl+PzH7k0EBWAeJkIdZ9LtmevWtZcUGVuq1+4jE5dB3zgH2TZj4zGvB
         UdVevoqL+9QjhcKCQ1LG5BdBC3kJrERND6oD3wiDUrrrG9xInRa3cYkipfkHizCipLdk
         z6gBK++WPMFZdtQ8SoednBM9Vugo3Q1pM3szIptC4dndQIwDEd86RzbE1heTCZ325PJw
         0U+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795571071; x=1796175871;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kGQETZ/T+amttlTIZ7lR9ey6wrw1motDP5sTzBHtntc=;
        b=atTxDYUkLKA50+roI/UqAJ/l+0IhsflEAD8k8GpFHu8VK5HGNg87HlhLM2YsQfBnHC
         Lc90mDFlkdij24CkuEO2eoezDNz3kdQ68KpEv56CBsemKg0Ev/6NyECJic731LtxDrDX
         N1MQXDY5AnKrCC5vIXkeEbtr4vxWGD/BGbefYaAYwnhh54jqikdu3mPPNIaURMF0xMKE
         5Uh9DlnWRh6nWftPZULp0TWyVNEfFljfB/kAShdqwGXCyce5BmPL9nNwa4ZOlVmf3Bcr
         DOjYjanODmHFUsQByjbBPurMCD4+LRo0iNcOsgjX+4zvWB/2o6vLRjF+Lqbrn/7GQeIC
         eW7g==
X-Gm-Message-State: APuU4Z+r4DsKOrMpyPX9UPO15nLZF7wu6JnfzoByezpbWSi0YYqw7h6S
	0O+X2ODzidR1/NHOmdPCTRgMUhhgtkmxwv55YgTokgEQg5/O3wJzvQzaoBUPHgqE+fAjaf1MHnl
	BwGKnkNuwzCjiM9w6AX3IHYiOw4gkHXLvHSY2qZOx80M/toNoIVkzUvWFD79f5O4PfBGxKgABWT
	FK0g==
X-Gm-Gg: AZFdTZef/WBSNhgRDG6Yd0IJ3GhQstwVlh2zqOVGXdsJCsg5YhgTesag1yYciQzMy1k
	cX6IR5VRqJ9A16ZCowYnfh6WhzvBLZPcsl12Hjs10Dz6/gfVgLSbzQw9AUaYZduF3JU50FMkp8t
	d3FiWCU0ycDrm3j+TNOlQAPKl8jTkgiQ9JzENeYPpyTqrYSTkbYEENgI4Y+BdwceONM4+2+lbyW
	pr00BXIuviwEBeYGPdQCJV8+qo6/XIe5vhyRZmtQmslxq0THxovWbJ3qczs0WYw0qaj0Ndo7+Ed
	UZ5wIhdGvDy5lClSi8w24TtQInAc1rMIKTcIAoaX8EJbM6sax2mDkbxXbBpAqPz6A4stA3/WbFF
	P+kJdHyb8sijsirSMT0EEGwPJgFZA5MbPXwfeLkZBRBTlpNDIrVDbbKX7hGBwux5+uwI+knSNNG
	fZe+h0l1CEBQFfserjTpSwm5Z5a6ed
X-Received: by 2002:a05:701a:844e:10b0:1ae:4ead:8cef with SMTP id a92af1059eb24-1b55690e180mr15766352c88.30.1795571070769;
        Tue, 24 Nov 2026 17:44:30 -0800 (PST)
X-Received: by 2002:a05:701a:844e:10b0:1ae:4ead:8cef with SMTP id a92af1059eb24-1b55690e180mr15766323c88.30.1795571069933;
        Tue, 24 Nov 2026 17:44:29 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm30680237c88.11.2026.11.24.17.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:44:29 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:44:26 -0800
Subject: [PATCH ath-next] wifi: ath12k: Use bare functions for
 ath12k_hw_params::wmi_init
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
Message-Id: <20261124-ath12k-wmi_init_param-v1-1-56f9142cc262@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHk9BmsC/4WOUQ6CMBBEr0L225IWsKhf3sMQUukiq1KwLYgh3
 N2CB3A/JpnsvpmdwaEldHCKZrA4kqPOBCN2EVSNMjdkpIOHhCdShGHKNyJ5sHdLJRnyZa+sapn
 kfI8yy/JjWkNge4s1TVvuBQLCDE4eit/GDdc7Vn6NXW8bcr6zn+2FUWzEn7ZRMMF4mquDRil0r
 c+dc/FrUM+qa9s4CBTLsnwBi3GVoN0AAAA=
X-Change-ID: 20261111-ath12k-wmi_init_param-6005e644793f
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b063d80 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d04gWkbmapECy7QOw1EA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwNiBTYWx0ZWRfX/AUzMO72z1oU
 1HTerqBMt+qtRkWEF93ZKHRkfUfr96mrsQGd76UNZRT4MFSOAGjvypbm2D49SkKhRmQHF5aqip0
 jIzUzGqPmkICaF+sIYcBF9j47bhLYLPCLyXeJRHJNJ4NhIbUET8Ha0PSpIuHiN1Yw3URkiaBdXi
 GSqUwf3LSseP8LSZj2HvrVqmAeto+rGZinWYKG1sKFFw5ILKTv7xyvYzRrKk9PPJSTlk4mEIIVa
 vrqqKN7KLcC5BfkBJzbtCpEszS5nIUxN5DIoMEssR3DRNbXhkBgzY4YP/nnI/h6/eSHCyNfPq+r
 RUAEaZH7qb7vLiBYxZU9wzS+4Qp1lRauDijTIN552Ez9YeNhj0f7oz1eKsQU0Moz+L/1SkL/4Kf
 zwPZ1XX0MnpfLdDWGbM+e+bIbMmZDkLvp5X1aHcbxHEm6ZFWSMyLLaWEPbOG+c61dWgH7Kf6o0w
 RaY8ioKkxaXtsAgmlFA==
X-Proofpoint-GUID: n4JgUEucfeNBsY-q-5O0n-W4znQPfTvI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwNiBTYWx0ZWRfX1eFiNPP25QL3
 rXuFTvBXlMmq8cbxEEDnnIXvaX6ujGoAIHkU9fobqKO34dvk3UI5OtbovX2MgefG1Mocln3pSD9
 y8tnEyWY/DvisiRd2DPO2p9dO/dUcQI=
X-Proofpoint-ORIG-GUID: n4JgUEucfeNBsY-q-5O0n-W4znQPfTvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250006

Currently there is an inconsistency among ath12k_hw_params::wmi_init
initializers, with some using bare function pointers and some using the &
operator. Normalize them to use bare function pointer syntax without the &
operator, consistent with other function pointer assignments in the array.

Compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
Issue flagged by Claude Haiku 4.5 during code review, and fixed by the same
model. Fix reviewed and validated by me.
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..16896118d2f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -743,7 +743,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.num_tcl_banks = 48,
 		.max_tx_ring = 4,
 
-		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
@@ -933,7 +933,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.mhi_config = NULL,
 
-		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
@@ -1023,7 +1023,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.num_tcl_banks = 48,
 		.max_tx_ring = 4,
 		.mhi_config = NULL,
-		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 

---
base-commit: e2d74a4def28e220ad582d17c27e7597690e601e
change-id: 20261111-ath12k-wmi_init_param-6005e644793f

