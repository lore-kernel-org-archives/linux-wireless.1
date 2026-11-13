Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565384;
	b=1IuqWwTb2xe+xIXeMfR6vn1saq6yqlvjF3TzNlAwn5pYhIanvKC+LF5cA/+90HboXILg
	 4ESF5GPGNFsURPDSyzZF50gEtyNQZd/NvuBftcspyzekHtp2ALGam6SVeYldo62U0fEoC
	 I7hWNCdXVhr4PfHCpfIOE/cQL3l/oLgwzEgdFNIuT/BHXPc8bos7oQ2+SrWVpz85Rirk4
	 piU+NyhA8ARA1tmuU5ruMwIBBf9FeIV6+2ErYTzD93xshvq1GO/i8PJPic1bt6xxeCT7t
	 A54kIEvEpw9zRAxVxczBlhntEKg+yGzZ4vbshbzMi60W1GwdQwOD95fohWC3seO4SkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E8Cdb1nmvgEMOy98nttXzCKdGk2Aya+PM8D1dPE+u6o=;
	b=q02P0LPgXza8Q9B6o8Fe7St/LPgg/REexIQ7QGFxKVdNCMALu542YdYVF1dXEe+5cB8+
	 EQAsuWUkcf7H4fHoOGezKvexhJ6AKZCieMbF4OyIDTTSbBBxTtodVJ+1UWjnEtVdL5luZ
	 E4tdmNTjMJJfxflKjG70mVrpWR2AewRPA1K1h3T9Ein5NVOy8qKQaInJr1jiCbtCk3vYY
	 OKnMh1zTF+bgGDkcRMpCULVoiKhmXPaDOnJVmKBd0Qm/gIk7AkN2mT0oNYA1Ciwr15r5U
	 c6TwvQtzft4vTYQPKBJP2LPG2C4WaAMzNa5FJkNc/gX7ookBwsjTaOubIczh1vzPH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DFD2Fk2U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbLNzLyo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6E606A89F
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA6E606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DFD2Fk2U;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbLNzLyo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VJ2L2515639
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E8Cdb1nmvgE
	MOy98nttXzCKdGk2Aya+PM8D1dPE+u6o=; b=DFD2Fk2UMeDmVkzK4hwxpZgtiFQ
	uPrbXNnsLiRgoyif/4PxVJ/eLQ1WCwWPKZwhtzltspB70znEGI48EuJVR9f6TboY
	DJRMH/ADhgwxTMFvebYo4IgkfZ4JO/4yAD099pB1hZyKeLsutTMxBAkPkmckvJAg
	DunbG8S0AEJQwPaPjVu7H1nxoWejTX0jPzfCfkajMu6DrSWSUw5cEooAXORd+Zff
	8hWWAMqpwqRtTrXUTAifSaMXxwykIipdv0Zna8lZOc50FcRH9Mipm1c6hgjBSmG6
	8CAQ3XUxE7PQkY/UO7TuaYqgsBWhU50J11EXnyNoSVSrC4m8LFmtvfDB/DA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbkmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so2853800eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565382; x=1795170182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8Cdb1nmvgEMOy98nttXzCKdGk2Aya+PM8D1dPE+u6o=;
        b=ZbLNzLyoCFin6SogWjG+b+xWdHpt/TknNvxltuS6xVkMvC2DYy8Iv4CP0Qdflbx55k
         t8H1w5e5mhpdBuBjutJ6OzKeKMszsFXa90BC1ARKTFBF3CpJNWKsiWBZgbpGrlBgIetu
         ES0TjQU7kzRhB5lqE5cN9x+8lCzHK8bV6ESQU+zUY+q3TltBtCld4JVrLyGiLOiWzQK/
         zHpwFBAuQkcz61IkcS6mQdYuVsnN+VilNhfIl+VLV4K2FUuRA+DnGGUHCHDMwnrSBkGl
         4i2VNQ1XQ9Ox62v+7GcqXUQLEFOjkIHFgQfpJ6Bq6jD46LwO+uiKHZLJBbMDCIh26fnM
         /ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565382; x=1795170182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8Cdb1nmvgEMOy98nttXzCKdGk2Aya+PM8D1dPE+u6o=;
        b=G3eptU5FCoQ3zv3vKtG3E2WF7BipxKS8eSs8LF1+NnTKV1ZVvBFcQw3V/Mgi7ZgO6s
         JTKdMLrxB2AiXDGfEDNTysuJZ5avnOi9YZkQypPJ2Jwsd0aioeNjVFsmP8za7jKMqpuB
         EtjImMnPwwPCVdrQTa/k6uaXhPTBdJ80UBn5k8kBHPQ/v/z8PorXW0MOrQDGcoNAk1fR
         3KTXfaThsILaDnP7KpaxkV/8xVeqOVse8fZinIqKbM/AOoJIMcbmAs8HSHvI+o/cHEfT
         Ba3INX8IdVd0MDDQ3bi9+jqK3Iglx7EvAXQJlyXzJC8zg3nGyOoYXu7Iwpf8LqNoLzhe
         GYvQ==
X-Gm-Message-State: APuU4Z88P/fdULIBSQnn0Hkh1RZ1y1kgU27dc3KU8GxpF7ixJOm4yHTF
	hVxRoxJh/olyj+9XWGjUGkTiOXeungZp6DQcIf/ZuXmBnjQ2vVV5IX30yEoO9pdsh2DnQ+gIFyb
	HvLvMFEMLE9MY7FOyg59XffHW4Eq5CxdKk+p64nC7Y8mvhTIScMUmRmdfqC53dhP7/aMo1g==
X-Gm-Gg: AYBFou3bMBnN3agqx65PZjLOOtsmZi7d96HJU54apNaVnWkUd6orLHhLsNd6klXQ0Yi
	Kt5rs80cRtKTl//Mqzm2aNl7wsCPrsRDHHxfSyiPJr1AKlp0y03laUb8JHNA5SudDAwHGE5j+GY
	Vsks4tu5J5em6KtkSGlv7bAT41IdQVjl8AGT9u9Z2X5CSUS/AgIhfB1cNcG9EJcXaSgJ7IQovN6
	qpFwJK2KKC4wGLuddHxR4wAcu/BAGnyIO0gAQYJfwS2V33hPKKA6uf9sEEWitrERZm8C7oaX3UZ
	oed/x1SpHP+z90stBCxkf4s5LnHEF3lRxXWWpF678zxF3uroltJIwLPinPVfnpCKtNCd/oulYfn
	7r5ARMX2/iUUWTQ34JwdR15xn4oAZuaWtG5knKrJaFk5j0Xzhy8mcThZCW3xoydczMRaNaA58vY
	CRTGdMllmUbx4=
X-Received: by 2002:a05:7300:d08b:b0:376:6530:248f with SMTP id 5a478bee46e88-3796666dbbcmr2005694eec.24.1794565382255;
        Fri, 13 Nov 2026 02:23:02 -0800 (PST)
X-Received: by 2002:a05:7300:d08b:b0:376:6530:248f with SMTP id 5a478bee46e88-3796666dbbcmr2005663eec.24.1794565381462;
        Fri, 13 Nov 2026 02:23:01 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:01 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 05/19] wifi: nl80211/cfg80211: advertise NAN ranging support
Date: Fri, 13 Nov 2026 15:52:14 +0530
Message-Id: <20261113102228.1917973-6-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
References: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6e506 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=AEF9MEfIqb847dwsdnUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: qVpC-yFrb33vqjJQDMC3m62HWJLEQT-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX+C1EfRf4YTCa
 9JsPvaaK9zvI29wbCxbP/tInHm8aBxnAdhdMhExHMCQeNoELuq2ljeFthF2o5sBvEEQxZ0tVBia
 vZWP7/yx/svt4fFBjYV891a6Njmh16sIf570So4ybBxr0v67cXHViWs5QFktHpllJ5n53Hf49io
 SmgAskiMvOXcISpxjOqxosuemhqTzXNQptoVmzYuaJi9WYZ+pBnxaF0vjQXTBRiRsgcH1XwwBHc
 2p1qNLj11Er9vzaydBSAdBZzHRJ2zLiJIXVtFF97h0KChttqru+uk0aEd8C4T66w/e1QFm5g389
 NaEvrTqDO3jOdj8aqmq6xMxfFuS8D5hK/mZwMpZzyQ3VuZEheMVNUomT9s30jkX4C6IdSgcW8+m
 Zm6FLnmG44JcQceT5Ak/Wr4N8Krj6bbzbJSyom0IVmLQdsLO7Xa76566BtIFgBBMqMyjNFg7hmt
 zxCawVNP0wSvodHGwZA==
X-Proofpoint-ORIG-GUID: qVpC-yFrb33vqjJQDMC3m62HWJLEQT-a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX1ycdLBlaNnOm
 uK3xASgFYyL8V7zY7dyADZA3G8ulkxGqBNBUPg8uhmElXpc5WPcysCLyhWIaO2wWUchraDNkSPv
 QXYGS5VWz78tsDxFVe2KcQR2Gk7fM6Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Add NL80211_NAN_CAPA_OFFLOAD_RANGING so userspace (e.g., wpa_supplicant)
can determine whether firmware supports fully offloaded NAN ranging
before starting a NAN ranging session.

Add WIPHY_NAN_FLAGS_OFFLOAD_RANGING for drivers to report this
capability and expose it through the NAN capabilities handler.
Fully offloaded NAN ranging includes ranging session setup, update,
and termination, FTM protocol and procedure, and ranging report.

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 4 ++++
 include/uapi/linux/nl80211.h | 4 ++++
 net/wireless/nl80211.c       | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index db175abf9a24..b4a1aadf3639 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6451,11 +6451,15 @@ struct wiphy_radio {
  * @WIPHY_NAN_FLAGS_USERSPACE_DE: Device doesn't support DE offload.
  * @WIPHY_NAN_FLAGS_INSTANT_COMM: Device can switch to Instant Communication
  *     (IC) mode. Can only be set along with %WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC.
+ * @WIPHY_NAN_FLAGS_OFFLOAD_RANGING: Firmware supports fully offloaded NAN
+ *	ranging procedure, including ranging session setup, update, and
+ *	termination, FTM protocol and procedure, and ranging report.
  */
 enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC = BIT(0),
 	WIPHY_NAN_FLAGS_USERSPACE_DE   = BIT(1),
 	WIPHY_NAN_FLAGS_INSTANT_COMM = BIT(2),
+	WIPHY_NAN_FLAGS_OFFLOAD_RANGING = BIT(3),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b982cb29f89e..baca5b0cb8ca 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -9297,6 +9297,9 @@ enum nl80211_s1g_short_beacon_attrs {
  *	of the Wi-Fi Aware Specification v4.0. Can only be set if
  *	%NL80211_NAN_CAPA_CONFIGURABLE_SYNC is set. When IC is enabled, the IC
  *	schedule is expected to be configured by user space.
+ * @NL80211_NAN_CAPA_OFFLOAD_RANGING: flag attribute. Firmware supports the
+ *	fully offloaded NAN ranging procedure, including ranging session setup,
+ *	update, and termination, FTM protocol and procedure, and ranging reports.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9311,6 +9314,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_CAPABILITIES,
 	NL80211_NAN_CAPA_PHY,
 	NL80211_NAN_CAPA_INSTANT_COMM,
+	NL80211_NAN_CAPA_OFFLOAD_RANGING,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 1bb2782b6206..ab8ec24093ac 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3206,6 +3206,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_INSTANT_COMM))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_RANGING) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_RANGING))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
-- 
2.34.1

