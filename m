Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684863;
	b=w1Ftxu/y7lPgZq4Qm2Yw1rnXhBHnsOWkdm1NbpHKReLXfy171TTSekttxYqba7ZtV/WF
	 hWPOipPW2OrTlEOqEzUYQzKwOCwfsBNmNY4KzhYUs9EQEZAhQmwXlGKUWgGfJzbj7vxoG
	 tAP+eZwy4CwweZGk45TaLm68TylWTg0zknhhwg9Jed4pONp7y4Rh4Bw5Af5chfAZ6wBdJ
	 h8RBkAQLCtpEYamM6HnJ/6eI/Db4xYEWQJK8guGosT3iXPDGZihcpppps/IeyGLTUPqs2
	 +ouifLvzSortJcGaVgUDPd2Ka008ABULS83o14JOPXzFgvxDoVleWVengdJnuGU9r7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=;
	b=hEi2gHZb5OAY8BtLp6I8JYc2cnLW/q491xOg9bVWMKhstmI+pEDCVYoDXk6c1EpIE98p
	 74+lqTtznKr/gZFwQvfl4m7jBwe1XOeiGSIdyj168+7u3dEZbpeeOlGaQifm6e8ndZEaB
	 n73whHOZCICvlOJRE83rGWBd3i+55SusLlbs1TlyCGZlnYqv7Ag9Z1TlsOpvw6tyU24bV
	 baYMCxnmoyRcfvyVUXu7aZNxMPZuPOPJh0p5JQkvwMu72syFEPtXK13BGSmf3qlulHvSU
	 bwjtrs1m4ouJQQCpji/mSR3X2ncvEg3Ax2eXUI75jMgONTYHFJCpT9PeJQFQjDbzwFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DpieXgtt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cj4qx4zm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1F606A689
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A1F606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DpieXgtt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cj4qx4zm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3RC2335196
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eJnnvQ5aLDs
	D97522fKzkf8jFAq8ARUXVpXmP0iy07A=; b=DpieXgttU48CowZjrVSLWlpN5ig
	61tA8QpPZbpJ1HxPr+GfOuAXVdQ6SMlWoDkAa+qvxe22P0fAdz0QxNjZDuwMkKjA
	KzIkt4OeokSaCTv7TEzbkxnsV3rJy6l//ZNIgH7AU+mqTgy2o3i1AYGjjzbcUxek
	DB3hmw1vdHzHo+RlEsPHX90/i8HotWxDH4TqxwkxA3aHrcvFDyjUSz4swk1+b6SE
	+mjnNWa8nKQTNk6NDeoRYU9TRN+BKYcL+6sqiqKwsNtsB1hTmNhjSwtYoFAbcDZt
	g4daWwYR+Poi7WPCnNkIuiqCDMxY4It5ZXFeihds2O8XDDn7m9CV84VnXxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak01jy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:21:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so4752247b3a.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 01:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684860; x=1796289660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=;
        b=cj4qx4zmglMsA13kTeCfPEDCoppYRTowwDh1u3sPhProfUbsXSJuuC+Y42PV+5OZWl
         yHoe9hs2gP8zruVwsgvPzabENvERhfPCoXICY9yLCd3/lYmEnpPfiZZbjp98NMZsJbDB
         fLgCVfhDojdnvzP9zf6h9sOaxp72S5Nb5qHAtdIcLnVj/MiMTx+CdpTYor18v2XT9eUM
         WB1Vbe06Wm4wFjAhh5BAZyJSgOFeWCZF7FH0LwaD/bSekx5+H7fVJatfY2vB2D0VTKsi
         l1iEkXUJPW5BgGCfVkAQPdc8sPDOCdJgRjFsQzHmvnijcjy4BE0L5ajXZZu9fzayZhQw
         e9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684860; x=1796289660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=;
        b=KoeUHWQyo85joR/FdWciIBCvIFCYvvwaraWxB5LRnoSgPJGbOZP0m81cdCDDN+L9ZA
         6a9pCFKVHpHD+R79B7O/9eZujtRp0JMbCFdzozPLEKrJaw9CnBcj5//bs68AUrmvSBMV
         E6RBGmBUIxeAFHmxN4sPQkeIlNrxg6S476okmn8fD9a8Mx1jUW2O3HnoHRK/EiP1UCfE
         x6XJBW64PNcPLIjMvTwikNnpFDvDfc8C0OM+OoHZsp/m1IaeAvXpqnpkncvmOCxIPGgZ
         aaAcO6ShVRSDH1MtVuoxPxeHpTnWjokPdIrSHfBBSpuNT+BYvNeJ3besPo0YJ1WN/BDg
         T7cw==
X-Forwarded-Encrypted: i=1; AL+hErE4lFJMltSygqhYzguB/v5KQQozm4eB4GJ4NvXKDy7QvVPPyY0Z8HxlZl0i6KFNdoWFdDbrCGyOhz+JLHdjkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tcsrFROFa6FylpCIQpaP0dwYYhgHgkRB7aj/bMbCOhnm/42Vg
	4AcEbmwfD7bW224nsbxK3677VMpJTy9ZNQYTT84IxlZixJT7OGQEd745TrFf0eK310LKmlS5Eh/
	/hLXchzNzqUZzGyJ7QtoAUiR/8vO0apmUcGDwEO+vs9M4ESNI95IterAg6gogbwKf9NkdMShY+O
	fK47nM
X-Gm-Gg: AZFdTZeFhV1Hk5djERvFl6PVMMXvbKsRazGF9uNLuPc3mSxwbfK1LWO8MRyTQ/smmY/
	+HMlEFN4SgViJnHoHx0NI/6yo2NdWhTBRAZQIq/UlemKvQheXj5RDtQb/xmhlQzB6zgQe7+vdT4
	iQxDc9oaJvUxNVqzZOEX2aBMhBBliQoqnfQSSxvnwho56BpvuLTgKRTSMDkShOs6vuSWhOkEYM3
	dR2tAQnCdYBgyqORfZ+oP+9VqvdtrdqA3+Uetp0fIuhx10FXRBL4prygtEA5Yir+6G/X+hv5Ls0
	0lffdMI3WmL7g/wQinhU5v69mO2vY2CphB/wfbhmngpQ0Jer+Xj5aCb6Pbodp4Yyb20Un0FgVYo
	s1dxIdBDRu0hv5yocFh6fikE+ue24ceOLLhMfqyQXCgrdRFExFl4yCnQ/n+aC8WpAYGLmTohvlU
	LOGlB9V76xMcLQX58hqscA/dWVZCjGAx0=
X-Received: by 2002:a05:6a00:1492:b0:8a0:5f42:a482 with SMTP id d2e1a72fcca58-8c7de587185mr14794952b3a.43.1795684860352;
        Thu, 26 Nov 2026 01:21:00 -0800 (PST)
X-Received: by 2002:a05:6a00:1492:b0:8a0:5f42:a482 with SMTP id d2e1a72fcca58-8c7de587185mr14794930b3a.43.1795684859810;
        Thu, 26 Nov 2026 01:20:59 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:59 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 4/7] wifi: ath12k: skip links without channel context in ath12k_mac_get_vif_up()
Date: Thu, 26 Nov 2026 17:20:34 +0800
Message-Id: <20261126092037.462830-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07f9fd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gfZQdUK8Rj-w2-3WJ4IA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: z9Jn9ugv-x4Ncq_fizTwDszZSoCDL6SE
X-Proofpoint-GUID: z9Jn9ugv-x4Ncq_fizTwDszZSoCDL6SE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX5z2heefsAL4k
 XwukVh8tNtJQkjxUTa+5XmWqr8s2HpUGNrIUvHS2vj/dUfTLbMXcvJ2GSZCdpzifn9/PGyz/a+a
 u+6HdOYwKrgmUj+3h93aw7Pg9LTaLL8zcpZcM87CuDvogQcap1Bp8Mdz9zubKtMeCWt9w+3wuYz
 5YbQrt1JiaSone73xrMXXWProkMxIBkYjgc2Uq3wmYHaWKgNDqjia/TtIGVJnidTNIHqNUjSbhY
 xArcwzXLbvJQ3HJWHHYVuRpM8TS2imxgC7FtxEPSYed8jli5CGJ01969WK+HFRohUl9RpGRp6sv
 Vbpw3VNyn0Oxkxzv9r8uS60jwPWKK2ypnjyYkOFMblGCZU7IAb0tbJP3tHvxPzWgaSyasUnV192
 bmLkyGCuH4rNFyAwQK6p8emvcwLH9NCDLvc+oXNJme/8gr7K68Wn7px1AUObx8jt6y4W9vQuvdI
 qAUAjadi2TP0wD908nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX0rf/yOL1gu8G
 A/HY22PgUhuivBT4kQOb817F6ZlT6RySm/0VmnmCOxYCbeaLv52NLN4abx2ZiKR7aJygKiVqrPQ
 e/160Kyhds1jbRTHB53cM7KDHFjl6Nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

Active-link deactivation releases the channel context of a link while its
vdev stays up in firmware. ath12k_mac_get_vif_up() returns the first vdev
that is up, and that vdev is used to derive the target pdev. It could pick
such a deactivated link, and ath12k_mac_get_target_pdev_id_from_vif() would
then find no channel for it.

Skip links without a channel context in ath12k_mac_get_vif_up(). The
WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif() is kept, since
callers reaching it are expected to have a channel context.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d7234ef9c025..2b4dfef3efb7 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -953,12 +953,23 @@ void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
 static struct ath12k_link_vif *ath12k_mac_get_vif_up(struct ath12k *ar)
 {
 	struct ath12k_link_vif *arvif;
+	struct cfg80211_chan_def def;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
-		if (arvif->is_up)
-			return arvif;
+		if (!arvif->is_up)
+			continue;
+
+		/*
+		 * A deactivated MLO link keeps its vdev up in firmware but has
+		 * released its channel context, so it cannot be used to pick
+		 * the target pdev.
+		 */
+		if (ath12k_mac_vif_link_chan(arvif->ahvif->vif, arvif->link_id, &def))
+			continue;
+
+		return arvif;
 	}
 
 	return NULL;
-- 
2.34.1

