Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983781;
	b=vZVQvnUeWi7cLkVagX37Axfkeq2bYJ05bO/pQDH2ZLuIAhn4hZOwTWfjbYx/vpLWL8Rd
	 aTrfK85qE0PmecY58ethemRX3bhS5EvhVL/0bWkVR2U2Pv/W5oFcL3G6ijcI/LZX2tUFM
	 CAtyN173NiO1iOpu8X1k56t2ClpzMAbnruOX0C5BJTeV0mykBa08n0ZUOkcT1RX7QL6sf
	 M1Snka4Vg1i1v/7yISR3SUVhTSzdsjYDOqhVAq5XNeLaIO2sIFd3hWf/wZxHcRragj9zg
	 D7d5TCrKjYVKoQ2rx38qwpta1yjoQKk+nPMRdmxYJHLqKPozHPl2BAjTX2qKlLwr5Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v42tSfHA2n6pLA0Gi+C1bhg+0xT+4YBtPL/GNt646AQ=;
	b=PAFBHe5FcqKAlcbViN9O0StlD7xMSSxr/0IvjD0CzElsE9gu8iIJ1fkBlT/YN0chsVEa
	 i9VF0ssfikhFY0/Mxo0nN3ohpkXLzSYucV7VNSEf5Lit3Z8snl2RsSGRYBr5JOoNFrX/j
	 Hh1QdnUPmw2DfpvUQdaXxrtOM3SIv0v2I8Qu+z+oauL6z61A78mKwGVZtn5Gi7J2BQKiU
	 9TO7L27csPs03vs8sRKchEivG6U7KZ0poJzRS+ZT/RhbgYKhuM0fBIbhsU3ph9hoQFjWw
	 /ZaMNdsoWW0OROPDWiDWBrxvULPJgTLuZKF/qXajzye0LiEXS+TR1+s8E5HjCOJ/YVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YmMn8IRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtqTmKcK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8BE606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YmMn8IRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtqTmKcK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3W7764124
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v42tSfHA2n6
	pLA0Gi+C1bhg+0xT+4YBtPL/GNt646AQ=; b=YmMn8IRxEdT5zmouC92tPqgSk2O
	qz1OM5EAuOm9LvK3Cl3lEe6H+nH6iyIM+00wS1YFngMcRY651fwit/78V1sx2eFL
	MGa8XVW6kQ/30SO1ER0CeR+Sw1XCCcivzPofpsCB4OHzixEL5jX24gE0oHlb0u38
	9sKVa5xXsNTe9plxoMcOP1TGGSTypaj8wuyVI5uM3plPXSfLeZVzL6CgGQ9CmM0x
	Uqe0dBAyYcHGrAu+xx9Ra52KD+TK8Y6oSQ8KBCkeENNJ7kXq/+EXIAqpEC6klkZ0
	p9vMhH0zFECAmS2/W2MSwC0DRbkPsqXr6ES0ftDwyj0LkG5+/Jio5Zk7xfA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9k8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so745840eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983780; x=1795588580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v42tSfHA2n6pLA0Gi+C1bhg+0xT+4YBtPL/GNt646AQ=;
        b=UtqTmKcKLfAkwKA+oID/mmJqQNYaJExSwh8+okbzcyIkbdKYr7V782V6Dg7zU+GHTi
         mAsDQbEeIqP19i1ydeQJFdRypDOrvhtrDFEWxmDcFVwjyq0wTNWdT9Y6YMTAsqhlfirV
         VpG6/OBnKeD1lfqsaG/vQkMd3fYhITAPzG0z7sNeQgHi9NZtllLnL0EeRwUyg9BSKo9n
         CMiiwEowmaEs7FlqkqAz4Z5bIh7sNyYDJBQWWM/2CtNY97zTj/dmUI3b7LWtbeahjjCT
         XRXH87jW/+04pIP4/c+/QOF51TxLs0qSRPpnxEVMX8UrkESmaB0PttwjLOfewsmHmqQW
         GgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983780; x=1795588580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v42tSfHA2n6pLA0Gi+C1bhg+0xT+4YBtPL/GNt646AQ=;
        b=EkmQzfgb6pBFKvRBixGV+/mDfk7huEBoKRVvd22mSfGI61z+dOu0iKUaEyaPC6NcJM
         qWUPCij0MHeKa/+f890h8S7plTitZ+rXxqzZe46YhPMu6ZnuKysDdXrqHmAm8VzMSHt/
         VuFKeVSz9M3iyr3H4P/QCPDof1euL/9Qxp81JwxFHcp1QRHbHKC1j1d4k5K4hyhQBivR
         TgpJQXBLVYzr/5Uz8DxVZtCtXBVE9W4EOOiU1eD0RgjM7uoj86hldk48QzX8Zwmj6N9Y
         e74ikMmR64ZGU2NYrT+ZPN2eskX6Qtf4UtJw8Gf9IEaNa5hfO3KlzX65A2F4OGRrOigq
         GT2A==
X-Gm-Message-State: APuU4Z82vAwHCtfQFDdwmu3Q7v5z1yN7IFuziAUzDqF8Pz8pzClcOmvi
	22ZOz3EQQGQS0x1j+nPecoK6X5Xg08140/Ktl4rUcAis031q5N4knpYKD++kDWi3RZyGpIvmZ/N
	s6nEpJ/jjPZRxtlg7W6Iif9j1yNpsp5YnzB25Tnq+hwheq6SuZSvOORY4StNbtSnFHhyd0w==
X-Gm-Gg: AZFdTZfFADU7NVilfDg4gOFrirrQFYZcNdAkL/GwcxsRAw7OFtcUxKdMxICgS6yhmJY
	xWhrLPBfVlEeCHU3ttWjbNQCT8/q62O2GXKWEzmi31+rcX4EEtDnIX3ZLv3DXccgh0Bz09E2mFR
	tWxf7RpRxftvYOGa91A8d+qc765tQZq3mC5VSDzsN8+1XmsRJtmjwg1G6tA/bR4h0iLHFglbhe/
	lycePiC92gTiRLSfDNUu7cSGENAwd6F+tQ1RIbpILyXY6YGEOVz6wRQAVrRZjjVoFNOhvAO6zao
	p+OwsCME7/VvPq4phmpTIEgsLCmBXTRuEEzWhiw06DeVHadMkLm7hASUhr/GO/9IdlueMZK8nAy
	2Iz8YymsHmDpCX7GnhJgyvoEMaAe9MoDiK4K02jesc5RfbWUuPtGW1QVfoirau4euiU+xzRYb9s
	MYVS4hCno9cQ==
X-Received: by 2002:a05:7301:1808:b0:369:f9da:a70f with SMTP id 5a478bee46e88-3828007803bmr1556784eec.17.1794983779180;
        Tue, 17 Nov 2026 22:36:19 -0800 (PST)
X-Received: by 2002:a05:7301:1808:b0:369:f9da:a70f with SMTP id 5a478bee46e88-3828007803bmr1556769eec.17.1794983778487;
        Tue, 17 Nov 2026 22:36:18 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:18 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 02/19] wifi: nl80211/cfg80211: extend NAN function and configuration for discovery offload
Date: Wed, 18 Nov 2026 12:05:37 +0530
Message-Id: <20261118063554.2260397-3-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
References: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: EJPjIsBerv2w2l5H0ZgsYfE-TwdjdhDi
X-Proofpoint-ORIG-GUID: EJPjIsBerv2w2l5H0ZgsYfE-TwdjdhDi
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4764 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Gx1jd3SvvzcaTJcscWsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXzcrDckSBLn2W
 GIQKIdDxleWs2KIpuLuyFDTTbzMsVxkSEtq6krKgNABMDlMSgc7jFpBvZIXLhD280XiSm2V3fp9
 NLEduQER3gzHOUC6ltPUZR8dp8eV1yc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX1h1MtK7SkxND
 DAbwJY1BljcdkCvhg/zlzmsis/rZ66sWxZ/kPt0PWN1a3gPOnQfiMYS/3cYqHxpZun1tfkWtIX7
 ECWcO6vii9dK8Gts+YH7yR3WEe6prfHcfCmEzkLbm69GMJORDQQUCNu4s9wCvabq8x0Au/W1d90
 4Oh5B+eH/0PiunO1BWvLahHuXNJBxEQ8khqQN5dwzLaxdyc2CI6lM2py+h5bM1oTXclgjLSKJT5
 gYMW/OVH9plqWfcPjoRH48bUGlTz53Ka2QGBVdEhSJjU2GqBH4nAbykfoflaHsbzYY8MtomYG7J
 SItwJRv0IC+0HSdTdXY7WSwu0KdMmFYZ3WkNZRhjRwRF/FMBZm3+MxPmWjITU72nxdo78RI3C4H
 hB596uBz0Gnf6rvg8VxSNrHlBgCKmY5SZgfW1n/8Zi6lLyHtvXWMnIjhZFg/vgf0QwUsDirTe01
 Of41M7CDlVs6UNK66ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

Allow userspace to provide the NAN service parameters needed by an
offloaded Discovery Engine. Add flags for the SDEA Data Path Required,
Security Required, and GTK Required bits, and attributes for pairing
bootstrapping methods, supported NAN cipher suite IDs, and the ND-PMK.
Require SECURE_NAN for security-related service parameters, and validate
CSID arrays and ND-PMK lengths in the netlink policy.

Pairing Setup and NPK/NIK Caching are device capabilities advertised in
the Device Capability Extension attribute, so carry them in NAN config.
Accept these flags only when the Discovery Engine is offloaded and
SECURE_NAN is supported.

Store ND-PMK material in dynamically sized memory, free it with
kfree_sensitive(), and clear the ADD_NAN_FUNCTION request skb because
it may contain key material.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  24 +++++++
 include/uapi/linux/nl80211.h |  36 +++++++++++
 net/wireless/nl80211.c       | 118 ++++++++++++++++++++++++++++++++++-
 net/wireless/util.c          |   2 +
 4 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index c166f97dcf81..b6e4cec22652 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4249,6 +4249,8 @@ struct cfg80211_nan_band_config {
  *	notifications.
  * @instant_comm: if true, start Instant Communication (IC) as defined in
  *	Chapter 13 of the Wi-Fi Aware Specification v4.0.
+ * @pairing_setup: if true, enable NAN pairing setup.
+ * @pairing_npk_caching: if true, enable NPK/NIK caching.
  * @band_cfgs: array of band specific configurations, indexed by
  *	&enum nl80211_band values.
  * @extra_nan_attrs: pointer to additional NAN attributes.
@@ -4265,6 +4267,8 @@ struct cfg80211_nan_conf {
 	u8 discovery_beacon_interval;
 	bool enable_dw_notification;
 	bool instant_comm;
+	bool pairing_setup;
+	bool pairing_npk_caching;
 	struct cfg80211_nan_band_config band_cfgs[NUM_NL80211_BANDS];
 	const u8 *extra_nan_attrs;
 	u16 extra_nan_attrs_len;
@@ -4441,6 +4445,18 @@ struct cfg80211_nan_func_filter {
  * @num_tx_filters: length of &tx_filters.
  * @instance_id: driver allocated id of the function.
  * @cookie: unique NAN function identifier.
+ * @data_path_required: if true, the SDEA Data Path Required bit is set.
+ * @security_required: if true, the SDEA Security Required bit is set. Requires
+ *	@data_path_required and %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @gtk_required: if true, the SDEA GTK Required bit is set for GTK protection
+ *	of group-addressed data frames. Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @pairing_bootstrap_methods: bitmap of supported NAN pairing
+ *	bootstrapping methods per the Wi-Fi Aware Specification Table 9-321.
+ * @csids: array of u32 NAN Cipher Suite ID (CSID) selectors supported by
+ *	this service. See the Wi-Fi Aware Specification for cipher suite values.
+ * @num_csids: number of entries in @csids.
+ * @nd_pmk: pointer to the pre-shared NAN Data Path PMK (ND-PMK).
+ * @nd_pmk_len: length of @nd_pmk in bytes; depends on the cipher suite.
  */
 struct cfg80211_nan_func {
 	enum nl80211_nan_function_type type;
@@ -4467,6 +4483,14 @@ struct cfg80211_nan_func {
 	u8 num_rx_filters;
 	u8 instance_id;
 	u64 cookie;
+	bool data_path_required;
+	bool security_required;
+	bool gtk_required;
+	u16 pairing_bootstrap_methods;
+	u32 *csids;
+	u8 num_csids;
+	const u8 *nd_pmk;
+	u8 nd_pmk_len;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 97a9dd7588c3..55fc50519f8f 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7849,6 +7849,24 @@ enum nl80211_nan_func_term_reason {
  *	Its type is u8 and it cannot be 0.
  * @NL80211_NAN_FUNC_TERM_REASON: NAN function termination reason.
  *	See &enum nl80211_nan_func_term_reason.
+ * @NL80211_NAN_FUNC_DATA_PATH_REQUIRED: flag attribute. Sets the SDEA "Data
+ *	Path Required" bit.
+ * @NL80211_NAN_FUNC_SECURITY_REQUIRED: flag attribute. Sets the SDEA
+ *	"Security Required" bit. Requires
+ *	@NL80211_NAN_FUNC_DATA_PATH_REQUIRED and
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_GTK_REQUIRED: flag attribute. Sets the SDEA "GTK
+ *	Required" bit for GTK protection of group-addressed data frames.
+ *	Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS: u16 bitmap of supported
+ *	NAN pairing bootstrapping methods as defined in Wi-Fi Aware
+ *	specification Table 9-321. Each bit corresponds to one method. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_CSIDS: a set of u32 NAN Cipher Suite ID (CSID)
+ *	selectors supported by this service. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_ND_PMK: pre-shared NAN Data Path PMK (ND-PMK); its length
+ *	depends on the cipher suite. Requires %NL80211_EXT_FEATURE_SECURE_NAN.
  *
  * @NUM_NL80211_NAN_FUNC_ATTR: internal
  * @NL80211_NAN_FUNC_ATTR_MAX: highest NAN function attribute
@@ -7871,6 +7889,12 @@ enum nl80211_nan_func_attributes {
 	NL80211_NAN_FUNC_TX_MATCH_FILTER,
 	NL80211_NAN_FUNC_INSTANCE_ID,
 	NL80211_NAN_FUNC_TERM_REASON,
+	NL80211_NAN_FUNC_DATA_PATH_REQUIRED,
+	NL80211_NAN_FUNC_SECURITY_REQUIRED,
+	NL80211_NAN_FUNC_GTK_REQUIRED,
+	NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS,
+	NL80211_NAN_FUNC_CSIDS,
+	NL80211_NAN_FUNC_ND_PMK,
 
 	/* keep last */
 	NUM_NL80211_NAN_FUNC_ATTR,
@@ -8012,6 +8036,16 @@ enum nl80211_nan_band_conf_attributes {
  *	Wi-Fi Aware Specification v4.0.
  *	%NL80211_NAN_CONF_DISCOVERY_BEACON_INTERVAL must be set as well.
  *	This is a flag attribute.
+ * @NL80211_NAN_CONF_PAIRING_SETUP: flag attribute. Enables NAN pairing setup
+ *	and is advertised as "Pairing Setup Enabled" in the DCEA. Only valid for
+ *	devices that offload the NAN Discovery Engine (i.e. without
+ *	%NL80211_NAN_CAPA_USERSPACE_DE) and requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_CONF_PAIRING_NPK_CACHING: flag attribute. Enables NPK/NIK
+ *	caching and is advertised as "NPK/NIK Caching Enabled" in the DCEA. Only
+ *	valid for devices that offload the NAN Discovery Engine (i.e. without
+ *	%NL80211_NAN_CAPA_USERSPACE_DE) and requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @NUM_NL80211_NAN_CONF_ATTR: Internal.
  * @NL80211_NAN_CONF_ATTR_MAX: Highest NAN configuration attribute.
  *
@@ -8028,6 +8062,8 @@ enum nl80211_nan_conf_attributes {
 	NL80211_NAN_CONF_DISCOVERY_BEACON_INTERVAL,
 	NL80211_NAN_CONF_NOTIFY_DW,
 	NL80211_NAN_CONF_INSTANT_COMM,
+	NL80211_NAN_CONF_PAIRING_SETUP,
+	NL80211_NAN_CONF_PAIRING_NPK_CACHING,
 
 	/* keep last */
 	NUM_NL80211_NAN_CONF_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 5df058b835db..6847d1cfc4a5 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -451,6 +451,34 @@ static int validate_nan_cluster_id(const struct nlattr *attr,
 	return 0;
 }
 
+static int validate_nan_csids(const struct nlattr *attr,
+			      struct netlink_ext_ack *extack)
+{
+	unsigned int len = nla_len(attr);
+
+	if (!len || len % sizeof(u32)) {
+		NL_SET_ERR_MSG_ATTR(extack, attr,
+				    "CSIDs must be a non-empty array of u32 values");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int validate_nan_pmk(const struct nlattr *attr,
+			    struct netlink_ext_ack *extack)
+{
+	unsigned int len = nla_len(attr);
+
+	if (len != WLAN_PMK_LEN && len != WLAN_PMK_LEN_SUITE_B_192) {
+		NL_SET_ERR_MSG_ATTR(extack, attr,
+				    "ND-PMK length must be 32 or 48 octets");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int validate_nan_avail_blob(const struct nlattr *attr,
 				   struct netlink_ext_ack *extack)
 {
@@ -806,6 +834,8 @@ nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 		NLA_POLICY_RANGE(NLA_U8, 50, 200),
 	[NL80211_NAN_CONF_NOTIFY_DW] = { .type = NLA_FLAG },
 	[NL80211_NAN_CONF_INSTANT_COMM] = { .type = NLA_FLAG },
+	[NL80211_NAN_CONF_PAIRING_SETUP] = { .type = NLA_FLAG },
+	[NL80211_NAN_CONF_PAIRING_NPK_CACHING] = { .type = NLA_FLAG },
 };
 
 static const struct netlink_range_validation nl80211_punct_bitmap_range = {
@@ -1353,6 +1383,16 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
 	[NL80211_NAN_FUNC_TX_MATCH_FILTER] = { .type = NLA_NESTED },
 	[NL80211_NAN_FUNC_INSTANCE_ID] = { .type = NLA_U8 },
 	[NL80211_NAN_FUNC_TERM_REASON] = { .type = NLA_U8 },
+	[NL80211_NAN_FUNC_DATA_PATH_REQUIRED] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_SECURITY_REQUIRED] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_GTK_REQUIRED] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS] = { .type = NLA_U16 },
+	[NL80211_NAN_FUNC_CSIDS] =
+		NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_nan_csids,
+				       U8_MAX * sizeof(u32)),
+	[NL80211_NAN_FUNC_ND_PMK] =
+		NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_nan_pmk,
+				       WLAN_PMK_LEN_SUITE_B_192),
 };
 
 /* policy for Service Response Filter attributes */
@@ -17262,6 +17302,27 @@ static int nl80211_parse_nan_conf(struct wiphy *wiphy,
 		}
 	}
 
+	if (attrs[NL80211_NAN_CONF_PAIRING_SETUP] ||
+	    attrs[NL80211_NAN_CONF_PAIRING_NPK_CACHING]) {
+		if (wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Pairing configuration requires an offloaded NAN Discovery Engine");
+			return -EOPNOTSUPP;
+		}
+
+		if (!wiphy_ext_feature_isset(wiphy,
+					     NL80211_EXT_FEATURE_SECURE_NAN)) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Pairing configuration requires SECURE_NAN");
+			return -EOPNOTSUPP;
+		}
+	}
+
+	conf->pairing_setup =
+		nla_get_flag(attrs[NL80211_NAN_CONF_PAIRING_SETUP]);
+	conf->pairing_npk_caching =
+		nla_get_flag(attrs[NL80211_NAN_CONF_PAIRING_NPK_CACHING]);
+
 out:
 	if (!conf->band_cfgs[NL80211_BAND_5GHZ].chan &&
 	    (!conf->bands || conf->bands & BIT(NL80211_BAND_5GHZ))) {
@@ -17600,6 +17661,60 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 			goto out;
 	}
 
+	func->data_path_required =
+		nla_get_flag(tb[NL80211_NAN_FUNC_DATA_PATH_REQUIRED]);
+	func->security_required =
+		nla_get_flag(tb[NL80211_NAN_FUNC_SECURITY_REQUIRED]);
+	func->gtk_required = nla_get_flag(tb[NL80211_NAN_FUNC_GTK_REQUIRED]);
+
+	if (func->security_required && !func->data_path_required) {
+		NL_SET_ERR_MSG(info->extack,
+			       "SDEA Security Required requires Data Path Required");
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (func->security_required || func->gtk_required ||
+	    tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS] ||
+	    tb[NL80211_NAN_FUNC_CSIDS] || tb[NL80211_NAN_FUNC_ND_PMK]) {
+		if (!wiphy_ext_feature_isset(wdev->wiphy,
+					     NL80211_EXT_FEATURE_SECURE_NAN)) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Security attributes require SECURE_NAN");
+			err = -EOPNOTSUPP;
+			goto out;
+		}
+
+		if (tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS])
+			func->pairing_bootstrap_methods =
+				nla_get_u16(tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS]);
+
+		if (tb[NL80211_NAN_FUNC_CSIDS]) {
+			int len = nla_len(tb[NL80211_NAN_FUNC_CSIDS]);
+			int n = len / sizeof(u32);
+
+			func->csids = kmemdup(nla_data(tb[NL80211_NAN_FUNC_CSIDS]),
+					      len, GFP_KERNEL);
+			if (!func->csids) {
+				err = -ENOMEM;
+				goto out;
+			}
+			func->num_csids = n;
+		}
+
+		if (tb[NL80211_NAN_FUNC_ND_PMK]) {
+			int len = nla_len(tb[NL80211_NAN_FUNC_ND_PMK]);
+
+			func->nd_pmk = kmemdup(nla_data(tb[NL80211_NAN_FUNC_ND_PMK]),
+					       len, GFP_KERNEL);
+			if (!func->nd_pmk) {
+				err = -ENOMEM;
+				goto out;
+			}
+			func->nd_pmk_len = len;
+		}
+	}
+
 	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
 	if (!msg) {
 		err = -ENOMEM;
@@ -21211,7 +21326,8 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nl80211_nan_add_func,
 		.flags = GENL_ADMIN_PERM,
-		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP),
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
+					 NL80211_FLAG_CLEAR_SKB),
 	},
 	{
 		.cmd = NL80211_CMD_DEL_NAN_FUNCTION,
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 24cf0a2ba721..980b16c72d4f 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2878,6 +2878,8 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f)
 	kfree(f->serv_spec_info);
 	kfree(f->srf_bf);
 	kfree(f->srf_macs);
+	kfree(f->csids);
+	kfree_sensitive(f->nd_pmk);
 	for (i = 0; i < f->num_rx_filters; i++)
 		kfree(f->rx_filters[i].filter);
 
-- 
2.34.1

