Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970568;
	b=HHnWxIMnVCigMmkV0HF7HBbfEK//20pFRtNJW3yYsFhGLpaItYSTCEV7w3pCoMxElWuR
	 06A4Y4zq6CB2zR/UhwtRula9G9kMV8ox3qgXj8wc7V5HFpZE6Ou6P64TBeHSzjHG3uTCi
	 zPfRuWmShTPK32dK9ysAEZUZXN0uVhjP6lPVn0edYSyExeA9tgrlzw8FYxfIyq7GuE+wg
	 eUAcKinbBVf9TMr0PaanSHTZsHCCm9WnV5FwpKKiBcJcdW0irv3rgCV4L8XO9wmpYZ5Zi
	 sRd6nd2viZlzrkOlCrCuhV/9i0IECmeoNuFQmdbPS6lCEvu/yxMkYaCZTBXUFFrWvTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=;
	b=KN15CHmPhwLsR65qIOjXX/ze4R89bbFutzHjmVL6a8Z4i7kpeZ1Xbagpykt1XqcqIM+G
	 J0XnA5/uooM55ua252abErnOtw02GW+iveZnrbGH7yF6VFIW6SN7yoD0qMHWcImrJNhe7
	 FXT2K//cMXwKd7D76Sy9sxYaWPTj/z3ZwNTqxY4ouYWM+EAZonx59J0MCgKTbjEDZvIIa
	 V4fQyO3m0u5yO3T4z7d5CrUKfWdc2TftqZW53ePg3M/T/LQ0WnzacyLpUA6+EDSSssdYO
	 NcUl6g4baUN5Xkvh8KDsUbhRb1u/Pm5zXW8YiVg2WPwI82GVcGrCN4X1mwIio1PbpXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T/ok9eOa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5S1Daq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE64606A334
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE64606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/ok9eOa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5S1Daq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvRl2453546
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sEL7nqXI9Qd
	0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=; b=T/ok9eOaVHZOSaObsnv1EDiZf9W
	YZPCVauwFEdEDRFsaEm99+aQhh28WDR1O9OHHFFNiSPgmKNgMGG8HUVpUU2I1ULa
	05JHm9r22JjrH4sp33uGQiDQHh9YsIneGUgs6Tql2C//VIPuc+LniKvf/HHrgP0e
	dKlDEvJs/roybV368AcXKFYM4XM91UbMD8IL70ZdJMWBxVJadCrOR4d7iRdCLeQB
	zW2Zjk0LLCOj4k8sQ6i9s7lZZTfdOYL9Nq3ugkQlC+sq4PLLiJSYc4ylI/8uZ7U4
	i5VQ4js2iGfcoJxmQlDTqd9+5F/BzB6GKdOHJ960IykSLNbFPuUgGrSJpnw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv98uar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efda3bfec1so2571135ad.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970565; x=1795575365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=;
        b=hP5S1Daquo8gSY9XDKUNub+z/UL1P9qT7ugJgHk0Pa3xyUa7AW7DqWfB1MIaqNomZI
         eMI+k5hh7tHYW7fEBAJTYZOzGGA9ZUgIK7ShevmyAQFSLjA1rmHRZ2Wkp34x1w6vyQFs
         3TpBjADyxm75rkNJhySIRDeUZDOg4ciFrDnlDDTwYx9h99JbRG55A0QlpsKHmWULxlsM
         Q061OFPskdxwjmYevFVFQ+UDC/aFdDTxbW4DYM2BAmLEupDbh3iXUGfbsljmyoa4Lgg4
         PKZEzi5j43RXQAMohP6lhWJn70lAwDp1grUnL/jC3P5CIiMLcPF7Vf/19XTwddhuyVPA
         jTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970565; x=1795575365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=;
        b=PGtfaghKtHP5YuAO4K8MFLwGSmAKTCwlMwdUT/pxusi9v13cgj75qtxNxnbLAcJEQl
         I2LCo4+wOpw7GdlwLvVAlSbRkQ7OiSircUNJdxH1JelnoKFI8hEWOnrfqnzWji2YGuUO
         ZR1MifEVAcG/1JVXQk6LCw7/HvPsfc+xduPd8SEJF0IDskaTuTgdND8dlCSXD87VamCu
         9Gux5HPduYxdLaBkDQEq80bWN5UurX0j8ulKCIF8w2K1QtiWcJIQ5vZ1hpsSg0Eg/rfB
         JOs34dnHfetbxofbtN/2mzjzDzdU6rZNiwV91fu7cZZNWvpiw1BbK/T5kwW0UFZ4MA5i
         DWPg==
X-Forwarded-Encrypted: i=1; AL+hErGwLEWCCO1vX3itH2i+buHoy9aVdZw1agC9YHd1FxYYiZBcNaVkitHis9oPzZ6mgxn2+iPZLS3WhrsdSWMLZg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/T83hFNCgMltepFxlG1CObl7Tr9QflrA1ZYzg4PG9KhWGggOlk
	Ho0xs4+IFGJJsr8h6NBWFDBYTq02lvQ6WISVlJvyhzyzduKrMVT1UnfI+Qc/L9bw9t4nn2qKI90
	Ivt3m3mDePR0GIsYvteBMhEQej6KSMyhOncuGda4YqfamZYfZ1CBisUYbabuh77g0u//i05GZt/
	p41Fjh
X-Gm-Gg: AZFdTZe0f5XLj5sQUjA2lzEYiIvRkbvOr58yLVmzCT+8mb3MSpArFigMJSteedAwACu
	zsBceTS5DWyvNPyCSTy1hfJVBh3NkQtSXwyop9s3DQee711Rf2+8TjF3A37pHk1r17Y+bA43XcK
	k/fpPiwAbQc8FgSrAQO24p9Vx0Nr4hYVJlWKbhtqWkzYZ8sJys+/7VZd4pwCmN26V7ghjnDL6FW
	FuZPxoQ3rlYP5olT9OWtmRbPvT3SKmGx/7YHJx1D/SsUxOnt1suK12TZO/u99TMxXGjq8hN/jvy
	rV2qQjoOZa5yR1k6X383iY7zbksV+zDQy0BMImeYEWJMZKCzEeZmS4qLjU7LV2R/Ukt7wzZ4suk
	8M3vsC5TRHMTmUQN3YuH0//Y2NOuwXnAjj3csyHXSBDV1OHil0yOYWh5SEt494bpKca613GZCV2
	7sF1TQHMJU2cQz5WjcF44YpPKAaLWrIx8=
X-Received: by 2002:a17:902:db0b:b0:2ef:ec63:320c with SMTP id d9443c01a7336-2eff72e5ef3mr12527385ad.16.1794970565429;
        Tue, 17 Nov 2026 18:56:05 -0800 (PST)
X-Received: by 2002:a17:902:db0b:b0:2ef:ec63:320c with SMTP id d9443c01a7336-2eff72e5ef3mr12527215ad.16.1794970564992;
        Tue, 17 Nov 2026 18:56:04 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:04 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 3/7] wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link updates
Date: Wed, 18 Nov 2026 10:55:16 +0800
Message-Id: <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX2+RTBZVxtfUY
 NYLCXj5N8lPdOFIr0QPO2dLdFrQn/tiXBR8eBoo8lqXevQboKTNm1kvfHJ1eKiDwm//XM83HWCR
 /hJ7ACt/3vo5aa5jwwS7iiKKQCaWZQA=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd13c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Ns_Jbl9W-MFJWGn9c5UA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX1sigu+OuRRtj
 xmSOGZvFK47c+Eo7J+rgDTT8YoJbUhW+RXVIN4VEE7Tyv6qvlt037/oPzZdGYgCYpcf4iWs/E69
 dOHBfGuJYp7lpVTFUJ9KpTU9h2HlqieJwvHvs9D+X6v47GZdsQ3PJf0J7JYdziqIniME6jAGmjt
 N4DxGk8m79uwloGy4o9zKsBSa7pDuyuMXua4fAEafzxM3NkSQ1OXIyKnsaTTHceImL2osh3DcmJ
 xjwdRROmy7JjXVyD6cTAURePSQLt4FRiiX6/gEbXYFnFKMPuLCZGUuZyzXvSkhLaF97kz9SCqin
 B9lVUnx+AE2WPTkH6VMetj9y7Kr/VNZ6a8mA9Ifsg3wF8uQcp+tdKjGWjEomZnQzPJM6oliA39X
 LKTwyLFfKY6Z5ahwEWaIYPH8AulM7TPD4o6C1U3mvWz7xwoR9aVnRTQ5+8quWyYORReSjtXmxHN
 iCt6kj7kio+5fV0iSFw==
X-Proofpoint-ORIG-GUID: R70g_F7bivyFb3OVU16LKogW1BZIiELs
X-Proofpoint-GUID: R70g_F7bivyFb3OVU16LKogW1BZIiELs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

Currently, ath12k_mac_op_change_vif_links() derives the links to add and
remove from the old_links/new_links arguments: it creates a link vif
(arvif) for each link in ~old_links & new_links and frees the arvif of
each link in old_links & ~new_links.

However, mac80211 invokes drv_change_vif_links() both when the valid
links change and when the active links change. In the first case
old_links/new_links are the valid links. In the second case they are
only the active links, while vif->valid_links is not modified. A link
that is deactivated is therefore reported as removed, although it is
still a valid link of the MLD.

To fix this, derive the arvif lifetime from vif->valid_links, which
mac80211 updates before calling the driver and which an active-link
change leaves untouched. Create an arvif for each link in
valid_links & ~links_map and remove those in links_map & ~valid_links.
A link that is only deactivated keeps its arvif. On disconnect
(valid_links == 0) every remaining arvif is removed. The WARN_ON() for
adding a link that already has an arvif is dropped, since links already
in links_map are not selected for creation.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 315d80be304a ("wifi: ath12k: allocate new links in change_vif_links()")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3f106ac6141c..28cb549b1f46 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	unsigned long to_remove = old_links & ~new_links;
-	unsigned long to_add = ~old_links & new_links;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	unsigned long to_remove, to_add;
 	struct ath12k_link_vif *arvif;
 	u8 link_id;
 
@@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
 			   vif->addr, old_links, new_links);
 
-	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
-		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-		/* mac80211 wants to add link but driver already has the
-		 * link. This should not happen ideally.
-		 */
-		if (WARN_ON(arvif))
-			return -EINVAL;
+	/*
+	 * Link objects follow vif->valid_links, which mac80211 updates before
+	 * calling us. old_links/new_links only describe the active links and
+	 * must not be used to decide object lifetime.
+	 */
+	to_add = vif->valid_links & ~ahvif->links_map;
+	to_remove = ahvif->links_map & ~vif->valid_links;
 
+	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
 		if (WARN_ON(!arvif))
 			return -EINVAL;
-- 
2.34.1

