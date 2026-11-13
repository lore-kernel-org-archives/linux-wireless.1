Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565381;
	b=hCNYjJunkKlpbvtTdkGsl4sqVtAifzDuCI7G5qBoyNeNeiF65+I8XyV/ILsnTfCJ/YTz
	 zNztUyu2ykzm5hKHm2tvs9JQZLorBTOUB2+s6WNZ6jlplSWXB+mOBBs07oS5t/G0TgWnJ
	 346kbkLgyUrAB6wjGChZc/oxiYfHx9mc8IPbVtKbp52Ox78XV9CB5a8BJxawqxd2pgb7w
	 URfJw55nh05fTnZKdKdb9pTxaxIKE/ZWxli2acO9jNrXUGsLpQFnnWN2wdLV7MSm6e2SQ
	 2R5Uizm6FcmBg7pIUjiNLZUvlnGCwl0kvPgCjGMRrjh1YHeuWPKB2Juz266+kf3FYJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7BCeUzifsE4aG+oosytiHCzTy7JkV9sWalde1tHJKkk=;
	b=kEHjh1GwLEyrv5a1q6eDHDHkfTJ+h2dfpWGoyiXHJULeLI66w1K8yHrxaD202Wqxyolg
	 R2/+OLRyQf/cybOf2F40QcxMLn1iRO/784mCUJI0x5AcK+at0u0QPjcR7Yn/yM/q/N8fK
	 mf7GFfkD8E/ZHo7jQ9UKmhahMqEwqITD95CcSUqz7fC2eEBuLaW3CziSXUznHT1hKVzmU
	 jIqgDbuvhAlOl7Z96EwbnDDMLnURHHX3nPGUFXzXNH4N7l6RUWWgNpNidmb/i4zdijz4F
	 /jWnX4uDOex5H5Blw6o0z/6Wt19tiGIurNcoBRPH4VUUF1VZCXSy4IokOHgeRxwj1+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzxTDXxg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rkd78pZr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7CF606A89F
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F7CF606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzxTDXxg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rkd78pZr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VAKU074790
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7BCeUzifsE4
	aG+oosytiHCzTy7JkV9sWalde1tHJKkk=; b=jzxTDXxgzkgdx3lw1YSi4/Jx/PL
	iEVF+P61AP7v6EzMo4h0D1iPjN3GWOG+UYzEO6MCVY3PwAUqPS5NtQbS/9j/TVm1
	qituIb90ALY5xcf1N47FqW8WcFqoxhsqIuTEOM4H21ODzD2mmuF+26ky7MtIpYg5
	DMHBMUP+0IydtELKNw8YjgSDkXDdvDpDNwXHU4nH9mIYIvteMlg7rS1f46KpMd7l
	9B1qqT10iw3Kh660OA5rbFCJA7wgcgAVvuaY2B2zLYdzddsvz82drrJxKee00awa
	yQ4VOi2eN9duaT86AuohhTEiMrnPhbNXY5XsFwnOEq2Cs17tcaNQjDAyrUA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhvfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so2853686eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565380; x=1795170180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BCeUzifsE4aG+oosytiHCzTy7JkV9sWalde1tHJKkk=;
        b=Rkd78pZrZtZ+tTnwZ2juVu2ngYjSc+/SJXx1kn3Ap3wngKBQ3KwQtVJvQj0gkaIgyj
         HwrYifb0OpGkMv1mfvmA93y5P+RuNaYIXuSQxTZ3WBNomsHAJ055AvuyEBHY8Qx5tfGc
         cH0OhwvVX0IoUgkl2/sZW/B5bAjQ+tL643rzIEL/iRmRaOL9JidzPqBHnVnWqkYrsPvy
         +vz5YOk+bK77UJL1REyvCYF4AAFsBGm4wXicdUNoeRnGALNrNRRDEMVR3OiTDawNAZkG
         m9ye3U9RTrBL1wDvAEhJhThQ63CGs9podIxUA26By/dhQ2Dbi4YJPLqUJp8ZDOSQs6m7
         SHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565380; x=1795170180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BCeUzifsE4aG+oosytiHCzTy7JkV9sWalde1tHJKkk=;
        b=VmYGyQVkh9ivvFbIKhKsxzkeOFMdP8OuzSVWt0DaNtHdDx52sgHKXPQrd3v+dDgg2J
         KaPlyHMJN5nGN85hkBnNkDdJULhU3uSnm9IvfoyL3GxvoYBNmDY7mq8A9Kpl53sb2jFY
         WjD2Q7fKy3Evg5cGOLYZ4iEEBuF4mbKneAP8+I9c1KVqOPfr/d5Bv3pUpJJk4zi9RpYJ
         F1hAjq0MD7ra0fx1P/56JQxr0J2z/l16uGdqyZt5AHxEuSeyoYu63aK0FWlTMaQaHBt+
         43J9cREjeI00tiOAny5qPuCDMJ7a9XESZjqTKaEJ9XB1T879EcbFxJ0BBEW4u1t4/o9D
         6ciQ==
X-Gm-Message-State: APuU4Z805zamBSMyU+RsQ4tBUEzeHrRqzgG8m2b/jF/pNkX2Ht8P3CVB
	MQuBKdVGHd7dCgAvecrBEmXuHFt/RwB5Z+XAcXTWcVbv6AY8eWvz54bYUFvgc4cUQdpsceJ9OHn
	3Ae9bymhyFCEKye5UPNJgLkUhtJbnQcctyS2lQIUXFvHuI4P+PhZSCwQF0m90CQGmKae6MLR/Xf
	SywA==
X-Gm-Gg: AYBFou0PsFBUVX2HT8Yw3VUVryqy0/a+pQpEijA6TiVMSriCEOpf3PdjILnhMmWUrli
	T2WqH8PtDysAXdE18MYry5KdP9NALUvekP7i3yVcYgimSPzhGnux6ph5r5u+k7B4m6ygHevKwfA
	etEyEwgoU70SQFaWdxkGOxYIuE7H5O4qkal2IjAnc+vC3yWUHq6NhQSXqJw56j/wd4EFN+GVGpx
	pCDSkAQToVZGwqF3S+3Og2HmP4rfzGJ52EmlEW3kXS6XNfn0rTUck4zVGv7cTACyDl0OudViofu
	pdo4IHjjMSEcs/4r/RlIDraasjiJXYmCYR4UuO6mBtwbIlN4HB+tg7kRJZtyd5a7B8JXQAL/Luz
	oLZ5hs/SlxRc62WvvZSRzNujQHPOBZIDNAnAsKn48v38tQchmA8QCDlv21pPyvcYn3Zr2E4LVbg
	J9gmaHwAmMMFM=
X-Received: by 2002:a05:7300:d18b:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37965f9d24cmr1918331eec.18.1794565379653;
        Fri, 13 Nov 2026 02:22:59 -0800 (PST)
X-Received: by 2002:a05:7300:d18b:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37965f9d24cmr1918307eec.18.1794565378974;
        Fri, 13 Nov 2026 02:22:58 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:22:58 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 04/19] wifi: nl80211/cfg80211: add NAN ranging FTM capability
Date: Fri, 13 Nov 2026 15:52:13 +0530
Message-Id: <20261113102228.1917973-5-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: LCkiO93fjXTsnIkUk3fSneL_t7p3OpWi
X-Proofpoint-ORIG-GUID: LCkiO93fjXTsnIkUk3fSneL_t7p3OpWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX2wa5fWEziqmb
 j9YbwzeJAC9M41laZGvOkrG3yL0mRRbBUAc5E98YlPPEB+dMwZ4rUpGGCn4DKQoVIgaAMZTimNO
 Rd32OZUUcCa6N/TLdgmuskMjyf9MksVnq9hRTUjpGnNYANWTnsXhrIHWHi05K9eM65ISwBwfOCU
 MpN+YglmcWHitBm311lhVk60adRsFIUwnlAGWpf+fvUzWruA0YPg8lTFa7f539E+R5FMQYJQXj/
 Mx+tPMOwp/KCvQyWAS+nHcVfPncKoG8CxV1BGlnayhfTdU+49in5LQseYjpKNki+vumacuKggCP
 BQhXruOv4OeZYER4pf0r9HUSXe0Auv3zR4Wx20rP38k3Q/qqKmySU5bLApTWdef0ONhfCnZo5+L
 U4cpLuyMA8ICtuAPNoW6F7XBLwfaNaVtYsRL5EmkiCUyo+fT2YlAwCny90aBUOc6ndAPJdX5H2h
 RRZyxkWZAFUp1/yqjCg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6e504 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tHaWkjuROnUFulaCi40A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX284qXd76ulQg
 7pRUzfAPAA56mh0DfQFl6qXkwA3S8VTsiAfMV3XoZXenOE+mlwKsLvYsEGDyPqcf4PeGXYzDW5y
 IhZCtpiFwwCVnY6QZ7KePVPoUOwbooM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Add NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT to the FTM type
capability enum so that userspace (e.g., wpa_supplicant) can query
whether the driver supports FTM-based ranging within a NAN Ranging
Session before initiating a NAN Ranging Request.

Add the corresponding nan_support bit to cfg80211_pmsr_capabilities
and include it in the capability advertisement in
nl80211_send_pmsr_ftm_capa(). NAN ranging always uses ASAP and a single
burst, independent of the generic ASAP capability.

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 6 +++++-
 include/uapi/linux/nl80211.h | 6 ++++++
 net/wireless/nl80211.c       | 7 ++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9f412fee8fe8..db175abf9a24 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6314,6 +6314,9 @@ cfg80211_get_iftype_ext_capa(struct wiphy *wiphy, enum nl80211_iftype type);
  * @ftm.type.pd_support: supports peer-to-peer ranging as mentioned in the
  *	specification "PR Implementation Consideration Draft 1.9 rev 1" where
  *	PD stands for proximity detection
+ * @ftm.type.nan_support: supports NAN ranging as defined in
+ *	the "Wi-Fi Aware Specification v4.0, clause 8". NAN ranging always uses
+ *	ASAP and a single burst, regardless of @ftm.asap.
  * @ftm.concurrent_ista_rsta_support: indicates if the device can
  *	simultaneously act as initiator and responder in a multi-peer
  *	measurement request. Only valid if @ftm.rsta_support is set.
@@ -6364,7 +6367,8 @@ struct cfg80211_pmsr_capabilities {
 		u32 min_allowed_ranging_interval_ntb;
 		struct {
 			u8 infra_support:1,
-			   pd_support:1;
+			   pd_support:1,
+			   nan_support:1;
 		} type;
 		u8 concurrent_ista_rsta_support:1;
 		u32 pd_preambles;
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index c30dcba96763..b982cb29f89e 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8535,6 +8535,11 @@ enum nl80211_peer_measurement_ftm_capa {
  *	the device supports peer-to-peer ranging as mentioned in the
  *	specification "PR Implementation Consideration Draft 1.9 rev 1" where
  *	PD stands for proximity detection
+ * @NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT: flag attribute indicating
+ *	that the device supports NAN ranging between two NAN devices as
+ *	defined in the "Wi-Fi Aware Specification v4.0, clause 8". NAN ranging
+ *	uses ASAP and a single burst, irrespective of whether
+ *	%NL80211_PMSR_FTM_CAPA_ATTR_ASAP is advertised.
  *
  * @NUM_NL80211_PMSR_FTM_TYPE_CAPA_ATTR: internal
  * @NL80211_PMSR_FTM_TYPE_CAPA_ATTR_MAX: highest attribute number
@@ -8544,6 +8549,7 @@ enum nl80211_peer_measurement_ftm_type_capa {
 
 	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_INFRA_SUPPORT,
 	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_PD_SUPPORT,
+	NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT,
 
 	/* keep last */
 	NUM_NL80211_PMSR_FTM_TYPE_CAPA_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 3375aea01e0c..1bb2782b6206 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -2793,7 +2793,8 @@ nl80211_send_pmsr_ftm_capa(const struct cfg80211_pmsr_capabilities *cap,
 			cap->ftm.min_allowed_ranging_interval_ntb))
 		return -ENOBUFS;
 
-	if (cap->ftm.type.infra_support || cap->ftm.type.pd_support) {
+	if (cap->ftm.type.infra_support || cap->ftm.type.pd_support ||
+	    cap->ftm.type.nan_support) {
 		struct nlattr *pd_caps;
 
 		pd_caps = nla_nest_start_noflag(msg,
@@ -2809,6 +2810,10 @@ nl80211_send_pmsr_ftm_capa(const struct cfg80211_pmsr_capabilities *cap,
 		    nla_put_flag(msg, NL80211_PMSR_FTM_TYPE_CAPA_ATTR_PD_SUPPORT))
 			return -ENOBUFS;
 
+		if (cap->ftm.type.nan_support &&
+		    nla_put_flag(msg, NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT))
+			return -ENOBUFS;
+
 		nla_nest_end(msg, pd_caps);
 	}
 
-- 
2.34.1

