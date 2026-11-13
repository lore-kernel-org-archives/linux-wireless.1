Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565377;
	b=kj2eHpC/0cDiH9cvoVaTUobxsmzsBEZXHm3V96upDedrI2iBYKQUgAnVyIgcghwhS5Ef
	 2s5mf5IdHTGTp7HdZz7C+hwZcmmfBKQv8ho9C9po2nLzghuFjuNZvNJw9EV15ogMYDdsp
	 Bl+XUjQyFcNMQOmSeqGRI54FueVdnNUlEVBfAX7xtYb1s6/BZlL0TNbneeLOgi6wvRIui
	 NRYlOHPnnYvw8Q995dDul21js4s86uee5bwUfu8AyDtCBJzit27kCm4QbtTxtFHqGdJqA
	 EllTZIZtEnBapiJL2YXzSLsUjZGvfZoX4PSs5VaZ1JN4ZKA7W4SLacumBtDqf4cD5Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v42tSfHA2n6pLA0Gi+C1bhg+0xT+4YBtPL/GNt646AQ=;
	b=XbdZAzyKtASMGwHhRRZMQSF1Zm6l0sjLcSK46k95yJpJ2RQ0BmcnHkixoScd9BWI2+GQ
	 sDJ7Pcx3lAf0+IbniVl3YMsyX2yqUv/BkxcPAbkCUfNa4N11ifYiUQwrfeIP0Q+sjv8MX
	 Ee+ozxwn7zCXbm7I0QfdpLj87WhIAZlUSIsWEr28S/Mnq+VrLBcsAp+clGnLd78POyiCy
	 QsjBvks7iBuEbObvqeAsu29X3PybsGJtUknhZJavWfapfr8sAIAUn5cxyeto8NfAAsMEI
	 XfbwVn5mekhHQ2BibovJZ5Mwys0b0qt4CXueNh0rWnyS8piGr3rJBhIIfg3CHIjn2zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=keAV04bO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mup0gwcI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C3606A88E
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0C3606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=keAV04bO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mup0gwcI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VNDp2515782
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v42tSfHA2n6
	pLA0Gi+C1bhg+0xT+4YBtPL/GNt646AQ=; b=keAV04bOJCOmShi5TMfhZYevCGK
	/H5TIp6maf54ekS2R6BmcVF/sGxBg9YVIEmsMHsi6RcigFAqaG8X+Pe2s2p/4DST
	doIhRyZbTAF76C/CgASioQl+T/Dlnve68eA/TYdKF37+jVor5TWg/znLr4CWXrEW
	XxBSv4OnOgqJVc7B1nIStTQOqQLkf00vhqJtI10FklHzJji0q03C/gFrcLexRJI7
	EeltnGvRWH2YFdK+sQQ3Sy/GOE7jJQHooJvFsExNf8CFzcmjTYxAFo7A5lh98YB6
	02LCKZiPUpv3B7dBefIcADUJBnD300pZMEAmNqzL7FVibG8vzu2Eai7GhSg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbkm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so1146199eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565375; x=1795170175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v42tSfHA2n6pLA0Gi+C1bhg+0xT+4YBtPL/GNt646AQ=;
        b=Mup0gwcIK5OwbROLAutvCWJtzuxPg64BOU1l3X8LKWw2jteyfOCDUoO9YnFG1zylm3
         WIPoNQ9dMatSqGH/d3MpJDQIRRpJRPJBfRxO1G9zpD9gqyD2vDO5LOFEXdsjINVdbEPD
         +MKebHQliYA1mLNNyy9CgKwh1XjKLVdmivSYH05jPBwsNSZNi23dLGdOkJIaWgIiodbO
         DZeaESwLSgSq0dNJphG8O3HnLDdUhQR+wpdXEdzMZJ0yELSsbZgW0C9gSvI9LKiNe1ev
         WU3WWJ9MvyVRrnTb+D/g7qQ+1VEkVjW7LQW+eSU4RxZIu6smv+xK23f0aJ1/1+8muP0z
         BOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565375; x=1795170175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v42tSfHA2n6pLA0Gi+C1bhg+0xT+4YBtPL/GNt646AQ=;
        b=F1fmU2AhlP1FaXyRBg7yCvjTp21QZKlNIgc/eosdgCJHY3qCLWKd+7YB55XbHrE5D1
         nrixRJuGg3OT71gOlCo0fs/ptJmrSO+a70T0st5whCmb6z4gaQPXofyX9xqD7v2dgNgC
         QHlrD0Bg+IDdXLIHSSQAnMQG8kNyY2yAgQCSP+1N+ON/+9/NnNjOsV6Bts6c5zEfVGml
         CaE+m2ok42lhP4kDDUuYf2JjQtDpuJHwzVepmSaYoEJrGWOlFFw86yus6A3LHFpeJZgP
         Kw/ERbtLuk0BYTu4RGgjRjJT/Y3xNFFed8SuIZCzqE/xcJFmr7v1mB9oSXT5OTEIYB1D
         dgcw==
X-Gm-Message-State: APuU4Z+9b6SltcoOmwbrf3S64uY14wkfEm17EzgIZa7NdZv7QppWWbuV
	dGnq6IeHpqaEnHAuFvzlJ3EP396vCv8FHRRMBHZWo4ocjEWSiM0D7RPMEcyIiVRT+KHbRggVXYl
	0+t+CoMOt1BFsWcGJW4E2JNjLoK0b7LQsW4lSiidgBg1FZH4Det+/mccPZiqLp+tjt8f+xQ==
X-Gm-Gg: AYBFou2jq/BnZM2WIrdhxWNvt3W2zatJCqsCvK2G3WHDTOpJccOycvw7jIaE8zdwufG
	giInliNIhB3uh2IsNsyP1S9pM4L1/FFs37apJBV4NDCbwx5SWFJVNIkKr3zv88iS0ilvz6rklQg
	b2emf1MUevluARBSY/P8sYfhOYSEE1DgtTNc6dFWK5TMnAvfpdZBytUv7IBq+0M3rE/NKuSxXPC
	kaSibbCgt0rSaEjBLrq9wQCleByTr7pK3xGbqnik6yKNF+zawOlXKYWEWOPHJ4J9Gj2a4rWabIu
	ZzyJ2IeGIWOzqtB9RMr8TKBvpF8i2H3D27urpBIdHrokD7cR4DyGs6RuhJA2BK8XpMxJ4OqsAtL
	bnhykzj0+9tPjGfNwxX9PlEtnGG41sngfRiSBVBX6/caZbY6RkNL0Bd5xQhbpru/7OBU+tGxnx3
	iQ2f8czbkCFFg=
X-Received: by 2002:a05:7301:f2b:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-37968d8b5c6mr1985476eec.40.1794565374786;
        Fri, 13 Nov 2026 02:22:54 -0800 (PST)
X-Received: by 2002:a05:7301:f2b:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-37968d8b5c6mr1985449eec.40.1794565373985;
        Fri, 13 Nov 2026 02:22:53 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:22:53 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 02/19] wifi: nl80211/cfg80211: extend NAN function and configuration for discovery offload
Date: Fri, 13 Nov 2026 15:52:11 +0530
Message-Id: <20261113102228.1917973-3-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6e4ff cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Gx1jd3SvvzcaTJcscWsA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 9rb0fL-teE3HEWClbQYgu33FwdBMnlUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX8PWiCjJ3lB1i
 v10kr9Qbx3md70bnZ6cYWZnJ8jcXwycMkJSyRNF1bX6rJ/F6e2W0V5MNy8o0KPmgcBAQO8C91mX
 Epv205um/739P0j6UcwjMmZPtz+BuuG/LqOP9DcY5yJxKLR7mpNSmKPOVG7dyybLkjNqtrKWpIQ
 +SEMF3s/gCgEFlW2xmb9DwPvn0ilHIvzpfVSEyxahXHbTI1SrZojKKxqy95+0cet8iLxj0P3HUp
 qZ5tw/63cz1lI0alK62kaH4kJ7Bl1ALE94kgqjzqyd4dM5AhZJZ417jHeatvEh788sP++14Y95x
 h2lvaXeQja+4H5PbtiVM9j+fiSzPCKrFTXYxAGUVKUSU66K88vGWwF/AHLFiJw6r6A5HHckSZmU
 8mF92xYLHRnN8o4Rt1YjlGrjn0ZkOEjKqKxnM0XJlIdLwTwh63PlV57HmPT5t2FZKK5UmBoaGxR
 HI6flrFcNKa9nVILMlA==
X-Proofpoint-ORIG-GUID: 9rb0fL-teE3HEWClbQYgu33FwdBMnlUB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX1BdD6dbLr2MO
 Ma0or42oL9d0CpyAkZQGirhLwAVrogcCjL3pUpRMSXDmNzfXVOm8A4xvct7V1PGjOJLEzQZDc8M
 O27784Sw694/8KwEUUb7e7JUHWNZEc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

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

