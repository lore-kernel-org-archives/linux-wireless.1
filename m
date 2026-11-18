Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983819;
	b=tRp86jTIphNJRvkciueLZO2BSvylp1RDU7QQb6hKCCZxQ1ZbPGe7sVIoi/6KdhClblsi
	 0f2kBpx/rrNyQGTf0eLLFG3JxN2CaONy/F7qxaSrxF4H4CzJRzub29o2t8cpfS/xjR/vY
	 6rEC1aP++6xFc9+cJV/In1qtmWCWN9W1xPTuRb02ErWKOmhCDPA+vkHOEZXKTh8ydJIGk
	 Py/OJJC6/wknt6nZYbSmiNXOifEGS3cydVAVg3ATNtd0kx6ykcV/UsyWFI1MTFVvAzIeU
	 6y4eEbip+9xClVoZzOY9SVeGxDHlD40OfuMrAlyN8uJ+3qFnv4rAnfXi5yNl71X5MUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uon/wEpTiZk1tyM7+SSj/FRcoNhrSo+Jx86x2o0esz4=;
	b=HpV2ktukjOE6S1vdkVokEA8EIGJYKr1nTIxb4a1Zlcmcvp8MA7OlkHsuzcyqZ12bDT6M
	 XkEfGXCYg95h4E/0w5pEMT+Zr0ICXKoCEdKIii37t3ULnUF2vsH7ezt6CEfjLN6gok+mj
	 437TJqtLjSg1jzry8+HX0uHWgw3SCLWTU0xTl5sihrfxkWSutdmaJlDii/y+mO3g69wlt
	 r6R5Nc4Gr3jKPO1YcD+gJNvBKism8UHQNhjPXAuSwWT2gf+a/yTJnZC4ZuY/kja2638KI
	 SMsbgl19n/qKnsgGUwd8utPI8mimz5X3xCdVUIUmCdms+0KDGylSPGFrrZEPPwjWsow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQtjAnZg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V/4+yvpY";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68329606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68329606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQtjAnZg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V/4+yvpY
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uv462453546
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uon/wEpTiZk
	1tyM7+SSj/FRcoNhrSo+Jx86x2o0esz4=; b=EQtjAnZgWePxcmamvvUxIAAJU5o
	8nKEegW4gApMoTjnTxp/3bWRTp4h5o+fy5DEVpWObXPNOg8se7fad3tGAF0HL2cv
	+0LtEwgqdHBbcnxSqg/+4nYfs0zPjzE16lGwKNQ0cFDOuns+6zB8Bs6jG3J/qHra
	lDs5pAD9kJJ8t/sR7sZKEbJHT6Ma+qNlw055s6NhH1qq+EhuL79s+ZizrupOMZ/m
	Ov4ZgjwdS/gzv2vupM0Y4JExhFJmgz/tBCVk7XoGcEN7DwpinYBOqM6PIreVmAwv
	8StmSY+K3qinljaQcvtGj19u2MDXeh6hsmp8/8yDM5cKOLeUrNnjO2nTaMQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99juq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so746399eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983817; x=1795588617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uon/wEpTiZk1tyM7+SSj/FRcoNhrSo+Jx86x2o0esz4=;
        b=V/4+yvpYOKj2qzrApXefmwL/IeAl0ACCkJnHyp01pbgBziISWlatmOT4rsVbbY5E9X
         GWD27cHAPSgQHkmQciDApQManGr/L2j1739mEDSden2b9SLnkRKynmgUFip9dxCbD3zZ
         9rSQJAkEuQA0Kex73iG9b4VdB99V1cnYi1bSfEgsm63eTJh4MFryeIdiaz6CSyrjMpM2
         7/KkW9+eiCAvQnbeDrbShizP9dZv/eGvdt4c1JjWnws7QbNg4AhBFEgSOjdFma9h9Y1S
         SIYl++Xkq74iAq3ryjrY9WwaI4hETX+nmteQZ3F6iAwDoeWM27eiH3jN1RHCH0P1fQ4d
         OAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983817; x=1795588617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uon/wEpTiZk1tyM7+SSj/FRcoNhrSo+Jx86x2o0esz4=;
        b=q9z51gkoirhXHYytsHxsXMFeR9L+oiBPcuuS+VZRbmPEQe4MRnkg4cA8K4Zj9WIbku
         +VgyuUbmliJ31HNyJ7h51cg0JnfaA068ygWj+kmGyhnDI9cO8YJ9p8wHHoAPnyS+XJjA
         MIZjMdf2x9zdRoP/ABG1rBOjJ+6xGvzrq/u9MdcvbmotTmWl+qriz3klB1CWrhEU0BgB
         GybP4snTlpV7yfIDugPCNcTSLYTABK5zfXGwD0KgeBN1P/IqeVhrclmIPl0A5T7hIhg7
         /5wCtWkmeK877/4tKhqkv5b8qc4lYE0kYwSCcGUUMqDdR7s7Q4iwjulbvBAH8YSEoYal
         RaJg==
X-Gm-Message-State: APuU4Z+q/oKiPd9BZeeGApbpfVXGWGbqEcqkyA73mQYKchq/UcMdEl7R
	YbdMXAgGwaCyVVi/DgZ5Un0R+HVHB7vOXWphjCK/FhI7+eyrth3TD22VUAiRG90MajkZWH3wBTm
	W5R2MsqzGCvG9ifLlKTxZSgP4IHn7WA/eQJNm/XmrkyNG4RHtqlZu83manf8XGygsVRh1PA==
X-Gm-Gg: AZFdTZfK6bdY6VzlmtmROqYa2H4raIJrGXHKkO+jUqgl8uOokibvCdHOtdk2e8WNSJa
	g/XbCEP3QxhzXLRSBBELHtZ91tnfqP62KPTZXRCYH+osLGEopi73pAiZvNLE/0qzyO6Bs8DRkZR
	V6G5K8hBVo7RdW8+t1KwIx9Ha6iBJmWX8ME76W1Ln87ZhNGt905GotVwO1OUkr8vX5odjZUSnlu
	Z52DdEDLnZ9RDMTAHhtjhe5PwOw+jfyJBQiyWiY7fm7X5m8fIQDIw+X4acVSMhR7SqDiF4xsTmr
	6bDVTI6nglD+FsXURmrfkRCCdj64gsEaK8rfxVPqZUwcx09o9FkunxHj1QHu67OWg86oPwegcKO
	qvdqPzN5Ts4ijIC/Puro8sMX6vzZE98zl67bk+ZGNePsnJJ0DSIy6uS4a0Bf1UPXUIEczAJgHHd
	QyAnvYSQqyeQ==
X-Received: by 2002:a05:693c:83dc:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-382814184d1mr2004424eec.35.1794983817108;
        Tue, 17 Nov 2026 22:36:57 -0800 (PST)
X-Received: by 2002:a05:693c:83dc:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-382814184d1mr2004395eec.35.1794983816373;
        Tue, 17 Nov 2026 22:36:56 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:56 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 17/19] wifi: nl80211/cfg80211: allow extra NAN attributes in offloaded functions
Date: Wed, 18 Nov 2026 12:05:52 +0530
Message-Id: <20261118063554.2260397-18-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX1r3YTiqQEi/J
 vtAyiS4KSxZGgJQYQFuIw6xQu88+dHGzwNWQ8DaQG+hnytjmRJn1JWGAFxre6mJEsAE1nc6zAkc
 YPtKjUzO0/WC1APwIXLoniW98VJzy8U=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd478a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-RX98rD8DKRKJ5uf4OcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX+JyjANDacykS
 1tXAJZ8aEW2ASeNkhXa7NsKhufe93FQrzRO4JXFKSmWgZJ1Jyl5BGw0v/c2cPWLxKzk5M14cMrb
 ISOz2DuL6nmpu0DAxxBAs8oXd/Ff8VlNPI4H4eDPQDr4CP9u6bpPkakf5k6SCd8fIgnrDP37KFR
 TM/dBLUtUn6ZcuuapVE9tR5amVXTpvC7QZXunjlKOjoWmFoP0sFNUi2O0DwfibUr+HZjoowAk0z
 gJjjXPyi7lniu2kQRc2Vt1hEdMnGg3jsLpBSyJcWZrorZ5oufKaTXpZ/YICSvk3NnqfYPmsdtit
 mcVSu2xefot5vf/SgsIBH0gM67e71vULEvz5O/UNbeo6XNcL1z7tvmoK4s7fRAIgOtUX/QR9fDI
 g/HKLQ1x7OJG4hYIOCeQaoYeEUqm+PQPvUEv+HJkO8ngJn9OBYJhuX9a+DFfv1MKf6x5sFTTHAa
 9s8a87bSOHJqa/TVfcw==
X-Proofpoint-ORIG-GUID: LY2fH6MYmu2UKSUx51YhNJfUKQ5GBbyn
X-Proofpoint-GUID: LY2fH6MYmu2UKSUx51YhNJfUKQ5GBbyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

From: Vinay Gannevaram <vganneva@qti.qualcomm.com>

With an offloaded NAN Discovery Engine the device builds and transmits
the Service Discovery Frames, so everything that goes into them has to
be expressed with function attributes. NAN pairing, however, can be
handled in user space: the PASN Authentication frames, the bootstrapping
frames and the Follow-up messages with the Shared Key Descriptor
attribute are built by user space and sent with NL80211_CMD_FRAME. For
pairing verification, the NAN Identity Resolution attribute, which user
space derives from its NAN Identity Key, must also be included in the
Publish and Subscribe messages that the device transmits in the
discovery windows.

Add NL80211_NAN_FUNC_EXTRA_ATTRS to pass a list of complete NAN
attributes that the device appends to the frames of the function. This
keeps pairing, and the NAN Identity Key, in user space.

Validate the attribute framing, bound the length like information
elements, and only accept the attribute if the driver advertises
NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS.

Signed-off-by: Vinay Gannevaram <vganneva@qti.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 14 ++++++++
 include/uapi/linux/nl80211.h | 15 +++++++++
 net/wireless/core.c          |  4 +++
 net/wireless/nl80211.c       | 63 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         |  9 ++++--
 net/wireless/util.c          |  1 +
 6 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index e44c5da96ece..0964301473e1 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4690,6 +4690,14 @@ struct cfg80211_nan_func_filter {
  * @chandef: channel definition for FTM ranging.
  * @range_report: if true, a NAN Ranging Report is required after the FTM
  *	session.
+ * @extra_attrs: additional NAN attributes to append to the Service Discovery
+ *	Frames transmitted for this function. It must not contain attributes that
+ *	the device adds itself, such as the Service Descriptor attribute or
+ *	attributes derived from other function fields. Typical uses include the
+ *	NAN Identity Resolution attribute for pairing verification in Publish and
+ *	Subscribe messages. The driver is responsible for ensuring the resulting
+ *	frame fits its supported limits.
+ * @extra_attrs_len: length of @extra_attrs.
  */
 struct cfg80211_nan_func {
 	enum nl80211_nan_function_type type;
@@ -4733,6 +4741,8 @@ struct cfg80211_nan_func {
 	bool chandef_valid;
 	struct cfg80211_chan_def chandef;
 	bool range_report;
+	const u8 *extra_attrs;
+	u16 extra_attrs_len;
 };
 
 /**
@@ -6787,6 +6797,9 @@ struct wiphy_radio {
  *	cfg80211_nan_ndp_request(), cfg80211_nan_ndp_status(), and
  *	cfg80211_nan_ndp_terminated(). Secure NDPs require
  *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS: Driver accepts additional per-function
+ *	NAN attributes when the Discovery Engine is offloaded. This flag cannot
+ *	be used with %WIPHY_NAN_FLAGS_USERSPACE_DE.
  */
 enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC = BIT(0),
@@ -6794,6 +6807,7 @@ enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_INSTANT_COMM = BIT(2),
 	WIPHY_NAN_FLAGS_OFFLOAD_RANGING = BIT(3),
 	WIPHY_NAN_FLAGS_OFFLOAD_NDP = BIT(4),
+	WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS = BIT(5),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index e6172abab0d6..2581b7328867 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7980,6 +7980,15 @@ enum nl80211_nan_func_term_reason {
  *	using top-level attributes like %NL80211_ATTR_WIPHY_FREQ etc.
  * @NL80211_NAN_FUNC_RANGE_REPORT: flag indicating that a NAN Ranging
  *	Report is required after the FTM session.
+ * @NL80211_NAN_FUNC_EXTRA_ATTRS: binary attribute containing additional NAN
+ *	attributes to append to Service Discovery Frames transmitted for this
+ *	function. Each attribute is encoded as a one-octet ID, a two-octet
+ *	little-endian length, and that many body octets. It must not contain
+ *	attributes that the device adds itself, such as the Service Descriptor
+ *	attribute or attributes derived from other function attributes. Typical
+ *	uses include the NAN Identity Resolution attribute for pairing
+ *	verification in Publish and Subscribe messages. Requires
+ *	%NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS.
  *
  * @NUM_NL80211_NAN_FUNC_ATTR: internal
  * @NL80211_NAN_FUNC_ATTR_MAX: highest NAN function attribute
@@ -8016,6 +8025,7 @@ enum nl80211_nan_func_attributes {
 	NL80211_NAN_FUNC_PREAMBLE,
 	NL80211_NAN_FUNC_CHAN,
 	NL80211_NAN_FUNC_RANGE_REPORT,
+	NL80211_NAN_FUNC_EXTRA_ATTRS,
 
 	/* keep last */
 	NUM_NL80211_NAN_FUNC_ATTR,
@@ -9564,6 +9574,10 @@ enum nl80211_s1g_short_beacon_attrs {
  *	and termination with %NL80211_CMD_NAN_NDP_INITIATE,
  *	%NL80211_CMD_NAN_NDP_STATUS, and %NL80211_CMD_NAN_NDP_TERMINATE.
  *	Secure NDPs additionally require %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS: flag attribute. The device accepts
+ *	%NL80211_NAN_FUNC_EXTRA_ATTRS for NAN functions when the NAN Discovery
+ *	Engine is offloaded. This capability is not available when
+ *	%NL80211_NAN_CAPA_USERSPACE_DE is set.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9580,6 +9594,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_INSTANT_COMM,
 	NL80211_NAN_CAPA_OFFLOAD_RANGING,
 	NL80211_NAN_CAPA_OFFLOAD_NDP,
+	NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/core.c b/net/wireless/core.c
index 00e97ca901e2..1326786b058b 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -935,6 +935,10 @@ int wiphy_register(struct wiphy *wiphy)
 		     !rdev->ops->add_nan_func || !rdev->ops->del_nan_func ||
 		     !(wiphy->nan_supported_bands & BIT(NL80211_BAND_2GHZ)))))
 		return -EINVAL;
+	if (WARN_ON((wiphy->nan_capa.flags &
+		     WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS) &&
+		    (wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE)))
+		return -EINVAL;
 
 	if (WARN_ON((wiphy->interface_modes & BIT(NL80211_IFTYPE_NAN_DATA)) &&
 		    (!wiphy->nan_capa.phy.ht.ht_supported || wiphy->n_radio > 1)))
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 137ee621dd56..fe20d4eb6f4b 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -479,6 +479,42 @@ static int validate_nan_pmk(const struct nlattr *attr,
 	return 0;
 }
 
+static int validate_nan_func_extra_attrs(const struct nlattr *attr,
+					 struct netlink_ext_ack *extack)
+{
+	const u8 *data = nla_data(attr);
+	unsigned int len = nla_len(attr);
+	unsigned int pos = 0;
+
+	if (!len) {
+		NL_SET_ERR_MSG_ATTR(extack, attr,
+				    "NAN function extra attributes must not be empty");
+		return -EINVAL;
+	}
+
+	while (pos < len) {
+		u16 attr_len;
+
+		if (len - pos < 3) {
+			NL_SET_ERR_MSG_ATTR(extack, attr,
+					    "NAN function extra attribute has a truncated header");
+			return -EINVAL;
+		}
+
+		attr_len = get_unaligned_le16(data + pos + 1);
+		pos += 3;
+		if (attr_len > len - pos) {
+			NL_SET_ERR_MSG_ATTR(extack, attr,
+					    "NAN function extra attribute length exceeds remaining data");
+			return -EINVAL;
+		}
+
+		pos += attr_len;
+	}
+
+	return 0;
+}
+
 static int validate_nan_avail_blob(const struct nlattr *attr,
 				   struct netlink_ext_ack *extack)
 {
@@ -1437,6 +1473,10 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
 				 NL80211_PREAMBLE_HE),
 	[NL80211_NAN_FUNC_CHAN] = NLA_POLICY_NESTED(nl80211_policy),
 	[NL80211_NAN_FUNC_RANGE_REPORT] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_EXTRA_ATTRS] =
+		NLA_POLICY_VALIDATE_FN(NLA_BINARY,
+				       validate_nan_func_extra_attrs,
+				       IEEE80211_MAX_DATA_LEN),
 };
 
 /* policy for Service Response Filter attributes */
@@ -3258,6 +3298,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_NDP))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
@@ -17719,6 +17763,25 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 			goto out;
 	}
 
+	if (tb[NL80211_NAN_FUNC_EXTRA_ATTRS]) {
+		if (!(wdev->wiphy->nan_capa.flags &
+		      WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS)) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Extra NAN function attributes are not supported");
+			err = -EOPNOTSUPP;
+			goto out;
+		}
+
+		func->extra_attrs_len = nla_len(tb[NL80211_NAN_FUNC_EXTRA_ATTRS]);
+		func->extra_attrs =
+			kmemdup(nla_data(tb[NL80211_NAN_FUNC_EXTRA_ATTRS]),
+				func->extra_attrs_len, GFP_KERNEL);
+		if (!func->extra_attrs) {
+			err = -ENOMEM;
+			goto out;
+		}
+	}
+
 	func->data_path_required =
 		nla_get_flag(tb[NL80211_NAN_FUNC_DATA_PATH_REQUIRED]);
 	func->security_required =
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 0b0bef1e8cb7..85eb81d0d87f 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2448,16 +2448,19 @@ TRACE_EVENT(rdev_add_nan_func,
 		WDEV_ENTRY
 		__field(u8, func_type)
 		__field(u64, cookie)
+		__field(u16, extra_attrs_len)
 	),
 	TP_fast_assign(
 		WIPHY_ASSIGN;
 		WDEV_ASSIGN;
 		__entry->func_type = func->type;
-		__entry->cookie = func->cookie
+		__entry->cookie = func->cookie;
+		__entry->extra_attrs_len = func->extra_attrs_len;
 	),
-	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT ", type=%u, cookie=%llu",
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  ", type=%u, cookie=%llu, extra_attrs_len=%u",
 		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->func_type,
-		  __entry->cookie)
+		  __entry->cookie, __entry->extra_attrs_len)
 );
 
 TRACE_EVENT(rdev_nan_update_publish,
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 980b16c72d4f..4e1cbe50af1e 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2876,6 +2876,7 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f)
 		return;
 
 	kfree(f->serv_spec_info);
+	kfree(f->extra_attrs);
 	kfree(f->srf_bf);
 	kfree(f->srf_macs);
 	kfree(f->csids);
-- 
2.34.1

