Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057360;
	b=5o1xSTySkNGUvcMvY8Tgd69lxoeJ66Gk+EyShQiPFhu1azXRItAcFy/Ny2Piv6ihHHh6
	 vF2eLsLyi6pwBum0YPLve6ttXrTdNEYxWVTxR5qEUKS9CO97GxPTc45AHpgB72aOaZq8r
	 6uc/+6/Vbnn9ejaZIOwbA5lugk+rxoH3bbvNeWxZzOcAYdiLsKQSjRh2E0loZfDonKccq
	 MXBEEbf4Rn/Rn666GrJWPNfbZMszx/sfwa8E8iLqx97qyIq0HrD9UxvRFCjO0PLFZgeoa
	 xA6lRWLrhZliSp6XVwPCSMikM4tsWA1ClZ9jLic1SAevo40mUz4w1qC9rwZUnZgJr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Iixqc/javUnJztgMXXupuJF7pw8/6hkzBtQOPlzHrQU=;
	b=vpNAR7eoLBfZiPiHu8MwXrcFkzKzsONDKbT+Bg8gg+6NRrRKEpw5Zw1aLjQiNFHniFcU
	 IYLYPwIsRCiBsPymLkGonfCeTLKejZeZU6Y4/RrBO3RuZYETqDAsLO1B6WKJBgR9kagBU
	 SEflws8tKQZPi3QWwntzrLk1EXbHR6hpMdqjdWqT7tTnXwK8/LGX9VFyAiZqgw3k8mfR/
	 FP0eg39opw2Oap1+WW5VI5lYmxEHiEmfv9qka3aozzX78711IleXRdgy2I6ISLyXttMDh
	 CCylMnHSrc0givhTFimqN3PcTxAIThSgXFB6zp/aOmbECtVCFvmJtZ8Dyii7vhyZJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DWV+eRa3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hw/1yfEF";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13760A261D
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 03:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA13760A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DWV+eRa3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hw/1yfEF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1AtTM1927739
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 03:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Iixqc/javUnJztgMXXupuJ
	F7pw8/6hkzBtQOPlzHrQU=; b=DWV+eRa3nEtI9WmW9ECM9AwBsvCyv7+Fc35IUH
	FpPK4YW2nOH+bUJWzzQdwnB38BsAgEOfbl14BVezeuGhiLNNop4qfiZLcgEEFFe7
	00L3yxmbR4IECAhyenaJ0YCd4tIpBt7N29+2Zn8UoWDc9YjZQacrl2GnZI2gdefr
	eAz+pGRUEYryZZpF7I3e0PSQX/lS2sA2Xw4XHmtSDqrxNu9KT8KrmUhPT2SuYFsm
	zX5dsSOvqAzN98LRybn0xY9QgGlJJhCpncXV29jp40GTU3S/9RaMZgprAJ2g43Ft
	wFfqeNlk3wanaNdCKcswBFISLx050vWBgCvAIAav3fxB8yjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p28gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 03:02:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2166393eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795057352; x=1795662152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iixqc/javUnJztgMXXupuJF7pw8/6hkzBtQOPlzHrQU=;
        b=hw/1yfEFr3JyZru1Kf48OUGD0NSFithKnt6qJDp/ae2IjwpBb2Ex7/ZLgJEe19qwG8
         2eLN2rdelhAvRUI8b58yq9BwSw/pj4Sy7ZyERqnGhecAorSb4A/P4g+cdWqyqBiPcqeA
         kCwyiXizE5W/mPQolMNFTb01Fuv/xrSJZ1Wz4iBJyPRQGoKn6UOj6EnB4JoF1b5Mj9iJ
         b8m5Q+js+WkGsdU2vQNXSjLs8WsBIYoEO0ZOLD1fK2Hz04qoj+TFZDMXDDrJJf76/boo
         9TzcvhJ9rV1G7CeTA8xCRRfVfTUGNLyuu35xkq5FU6538Ls2WYRsbIynNu+G/qeXOpzQ
         REpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057352; x=1795662152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Iixqc/javUnJztgMXXupuJF7pw8/6hkzBtQOPlzHrQU=;
        b=mBSqRhb6cWbRsGSJozNiJc2rUETj+SNL5AaSvjDk5Z/g+6jjhn+DiJcZdq9JrMZiGq
         qDXesma1ipOyItKmnYUE46KWCNzSzNx5aFU3TOq35JniRocDSfzwqpHfvhY3M79oE3Po
         VSnBVzGwA5m+2vu7nAwg965C5GLxaLrFB77XnTH63bJl2C6j7vWXVpDjoHmfYwgLCw5J
         B1L8NyPwaB061VSYQS8ungvypTBHZuDJaCFPjAqIA9neKbm1iGKWU//E2FDg/3Y6r1zx
         6l/yvGY6Y8qm737fqxaSYN3CzZHS4F2TnzmZyivvUXOrPraWJvvWm2BFXlQqLMQPk0fA
         vTow==
X-Gm-Message-State: APuU4Z/NgrlNLMLXaejlObp6w8V+xJZGIT6MDE1/nk9XHH04jHuTojDM
	EpKDYV3/fTVw/howMZ0dkqssH0Uwnm/uh1WMw9ljuTtoxvcup9O99ejztND3cGrH/Ks3Q+At4/l
	d2UD6Su5XdenJpOsMtKqqp2t2jk7tinIF+v6gUKmLSC+PS7B/WEwD9AdwhSQRPq2QU9iWEw==
X-Gm-Gg: AZFdTZf5cjr7NNGmad43apfnS+X8W+ZGRIos3tjM1DBoWPs/m4UQjEkOc3F4BxwnQxv
	2YIaRWpje2UAs3L/2Mo4+pqO6twYVFEGIWBxiErnSTn9R7JaamZYOaXq0EHNIU6JGMx1YAPASWj
	qx7ObsAyvIOxmDaQqkgtuZIsgC5FSF4yQ21mt3VDQz7p2b/vZdGMyokpodbB6PiTFR+0P3UgEP5
	In0pVxzvy9CUe2Cl4GnXawE7kuG1t2GqWZ5Ikld+Eavaa/5Kxma5ajQopXcxoKzZQo8PdgvsJwo
	G9iImw6jhudrlsYoUJHZVbSAZkk6MSRQJrxSFgS7q5EvnLfnUX0MjC/vZt9qCPAOCI0zVZrLd6f
	Ybz3TtiEQJiof57AvjAL20h22D2mtOy1nQbjTv3ShtjkUrmL74KtmgsbUfP+PJdVrFgamiG88oa
	c/0bAxpnJmRqIVKcu2TDlLzoI=
X-Received: by 2002:a05:7301:1830:b0:37b:dbd0:ba63 with SMTP id 5a478bee46e88-3827da158c1mr3982800eec.3.1795057352178;
        Wed, 18 Nov 2026 19:02:32 -0800 (PST)
X-Received: by 2002:a05:7301:1830:b0:37b:dbd0:ba63 with SMTP id 5a478bee46e88-3827da158c1mr3982773eec.3.1795057351571;
        Wed, 18 Nov 2026 19:02:31 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3848dc19705sm132573eec.23.2026.11.18.19.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:02:31 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:58:12 -0800
Subject: [PATCH ath-next v2] wifi: ath12k: use hal_rx_mon_status for PPDU
 parse result
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
Message-Id: <20261118-hal_mon_status-v2-1-30b7f5d1b999@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMRl/moC/yWM0QrCMAwAf2Xk2ULbiZv+iowR18xGtBtNJoOxf
 7fq43HcbSCUmQQu1QaZ3iw8pQL+UMEQMd3JcCgM3vqTc641EZ/9a0q9KOoipj4GbJy1tj0HKNG
 caeT1N7wCajSJVoXub2S5PWjQ7w/2/QPysG1kfAAAAA==
X-Change-ID: 20261118-hal_mon_status-34da7100089d
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795057350; l=2938;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=Mnj+KP1qNFf6q674uDLc8Z4e6SKvAqhw1TeCa2+MBwU=;
 b=treNwdehkTRVpP3rSlAkpToPGptRNOFO886TUhzQgRrPCd46EgYSxpWhu5Izq4rdgTMye7wVm
 /cjrb3AbVbdBfNRMKXzQG+FLKXaJavjtnSTJ+yKN2E4adrfcQAbLruq
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: 9QtGDTsg6ApYwhyXg527thET3X01YCle
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afe66c9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hn8_Ye6xlahrUiIuuysA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfX+hIv3r4JC43P
 M+NyAJNm7yBwNauAir7Y2cZTaILRVpgwaocg+i/42qPi0obqiVLHlUZvFH1Cb9hmrOmUNh4/I2F
 1SCwq6HkifuZ40Cbg5YEomvI0CQ71bFo2wr9l7nHvZ/s1WSTMzCmZsPokOnS329W+OdgmaCTRyG
 b5a3VPVS+ZhIRf/IgF4j4/w1EGSf8CTe9HBDD4e88NO7/YmqYTbzVUhD/hrXC6IpfcEEJ6EqyY+
 SWAyt4ymb6bZX6jmI1sdFt9L2IBmbXueSm3DFfxcBcQHjonV/nR3dL+3qWZG7+fQMCyYnPuAq6H
 bgoJAMxt7LJ078KfKdw7wFrWm1p015bVQzPtuXynISWlCbmrniXzimroz93nvHAR+Ou8ZIeFeYO
 1mbEBrn3zq3wMjD7cuePcjKLGQ7a4D3vHDjwPobZELoMPNpKM9MzedIjZynGJsUIzp1vNo/XYuo
 V8uHgbbPB2AVHhkJbJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfX7bE/dWCuIYQw
 T25kZYyz7BG6oe62C3nRYK7NNCzLOMUpCCBNoTTzGoHbmOHJhG5ui9BkORFZCjZKPF5gUmMwmdl
 bExYNNqqkRARpWnkBWrjDWElUyoM+Gw=
X-Proofpoint-GUID: 9QtGDTsg6ApYwhyXg527thET3X01YCle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190011

ath12k_wifi7_dp_mon_parse_rx_dest() returns enum
hal_rx_mon_status, but one caller still checks the result against
HAL_TLV_STATUS_PPDU_DONE.

Use HAL_RX_MON_STATUS_PPDU_DONE instead. This is a cleanup only
since both values are identical.

Also, ath12k_wifi7_dp_mon_srng_process() stores the enum
hal_rx_mon_status returned by ath12k_wifi7_dp_mon_rx_parse_mon_status()
in a u32 variable. Declare it as enum hal_rx_mon_status as well.

Remove the now unused HAL_TLV_STATUS_* defines.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
v2: replace u32 with enum hal_rx_mon_status.
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 5 +++--
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h | 5 -----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 1c4fa29626a1..c6477ea4f915 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -3214,7 +3214,7 @@ __ath12k_wifi7_dp_mon_process_ring(struct ath12k *ar, int mac_id,
 
 		hal_status = ath12k_wifi7_dp_mon_parse_rx_dest(&ar->dp, pmon, skb);
 
-		if (hal_status == HAL_TLV_STATUS_PPDU_DONE) {
+		if (hal_status == HAL_RX_MON_STATUS_PPDU_DONE) {
 			ppdu_info->ppdu_continuation = false;
 			if (ar->monitor_started &&
 			    pmon->mon_ppdu_status == DP_PPDU_STATUS_START) {
@@ -3253,7 +3253,8 @@ ath12k_wifi7_dp_mon_srng_process(struct ath12k_pdev_dp *pdev_dp, int *budget,
 	struct sk_buff_head skb_list;
 	u64 cookie;
 	int num_buffs_reaped = 0, srng_id, buf_id;
-	u32 hal_status, end_offset, info0, end_reason;
+	enum hal_rx_mon_status hal_status;
+	u32 end_offset, info0, end_reason;
 	u8 pdev_idx = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, pdev_dp->mac_id);
 
 	__skb_queue_head_init(&skb_list);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
index dd60626b3240..3d7694c22774 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
@@ -41,11 +41,6 @@ struct hal_rx_mon_status_tlv_hdr {
 	u8 value[];
 };
 
-#define HAL_TLV_STATUS_PPDU_NOT_DONE            0
-#define HAL_TLV_STATUS_PPDU_DONE                1
-#define HAL_TLV_STATUS_BUF_DONE                 2
-#define HAL_TLV_STATUS_PPDU_NON_STD_DONE        3
-
 enum hal_rx_mon_status {
 	HAL_RX_MON_STATUS_PPDU_NOT_DONE,
 	HAL_RX_MON_STATUS_PPDU_DONE,

---
base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
change-id: 20261118-hal_mon_status-34da7100089d

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>

