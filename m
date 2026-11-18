Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983805;
	b=upzIwK50PWQsaYq+vT1v7UhUGfwE/+LuiK6nTvoGgtYPOKnp/QTAPDnnKh1chbyRljgx
	 R1GyJrXKNVq8YcpQwAjeMF9QKSfXW4YDehd70+KlFV5naZKXobt+eDjtG5XhrfCGxHPss
	 MTnKrcLF49/zWkBiJkMvNdDY5JSvPvMAtqZj6Bd0WxH/+wPmXyowKGwAA+Po89sZtUD9N
	 K2U9UjZNetYD2SL+grRJz7dXe4SyUDO7CIEgaB2vSLvnPrvKVwcRW573crm9mZbbEidkQ
	 4ltWEgBaMnDNekvZHxa/a1nrKX5C4RMfM0n9yDncWpyvV4eOAhLReSlsq0QPeXtf82w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1oLVRSyZUqXnzwkrKAF4Lyb2SfHQpMc5JGXALXu9ACE=;
	b=f2d+3/gl4EiNOe7GFojNCyZKrMajGNTocJ3bEdvwGYN6mU8t5SdUMru0LsUsD84I1GiK
	 /nt77az/1kTMPKTbEfNMBwEObI1HiWxJYAqVJ5Vp4Xpip0JP06K+I8OoiYqtKZ9Yj9SP3
	 SufAEoXRFa0tq+nuatizeHmzIC9sY4sEBNDo6ljk0u2S/sHaCPny/2QVqiX3WbY0rbdVh
	 V192lFC4VprYw1LyjkYbmVx3X5AAo8nXst/XhW4iZEksrQTNWQgj2tvj+W5aGK7NDEaZp
	 OYLd2aGLpsvXUhvFD3JxqPKJ7yTX/NfjBriVmtbbW8l9sxMcOeTD8md9efE5UgDJWbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlL7LdXB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFP1ZZ8J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7478606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7478606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlL7LdXB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFP1ZZ8J
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvJg4059960
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1oLVRSyZUqX
	nzwkrKAF4Lyb2SfHQpMc5JGXALXu9ACE=; b=hlL7LdXB1lf/9D1K5NPedBbPMM1
	L/2fqwgoh6dz+mHt42f0aJp8qEv1lrZ0LE04n89/GaWT/tm5exMJVFX+Y24zWmGW
	WPceyq0y8qgSuxQH6r0H5pgkYvqbF8/0AjpwQGi28qh0YxJPg8AnJAHZlNilchA9
	0E71vQyIEDUIaM4G0u6xR9PvRNVs1n3q/ISmlGEnA7xcX6Aa7oDzetCjUJhTMXI+
	kFOzWKZMF6eyUQEy1gVOcBo0BX9QEoPzN8j3cWKhbNERAf1wwlaegJ4/kP+32E1t
	QsuBr6jmtHT6MLGH58wI/KUrSoTtRu+YsJAC/HwlgcXnloOIgn3ek1YVO3w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchmk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so717918c88.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983802; x=1795588602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oLVRSyZUqXnzwkrKAF4Lyb2SfHQpMc5JGXALXu9ACE=;
        b=VFP1ZZ8JmJozwXw5cJRBm+w3lKNtEfSe7kDpkLNaZm5Io8zN9uQFWh48RCrMqCv4Y9
         IrDou9gIQG2EVD7K/YY5COijK+1mLMwuz2YTo/ZD8UpLiSRH6Z1VYQyK7KQCShP34/ZA
         FqKHUFi853u4QslsxUzmM9NSJBNy8UZZregZ2rfjolAanuFS044f1Smaqb9WYn/uUsVQ
         DS17+DDsvSf1eQuMTRjv9wL+swZvW/C6QCbFfvDFImDte9cbIT+nUbz1V+gKAGZVE3dA
         ZeFOE0norAy5LFFXDEg3+ZObbf7MoKTET7rqrmrtXBuiWgXrCiDGtfSRQZx1Xe+c2juy
         9qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983802; x=1795588602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oLVRSyZUqXnzwkrKAF4Lyb2SfHQpMc5JGXALXu9ACE=;
        b=RQA9c51ycY+uktZeRHKakM0QkY8F19Mzmc+qsMtWBRY2+K4YXantyYDtt0jLCohePw
         dBFKiUf/bY3PU2tgCHnwJ8PkR2TNgQ7rihTaNeO+ei6XXTmAZtn8eVs1Uddv+0kfb+dm
         Wl5d9fBQJ3nrLuvvg+my4M+cxFOidVPMYMQdTZkFyH0VrEm971x1h+O1+5R1rCsOCtna
         +sh3l3bA6jbmmgACo06l0L/7ntQF4TN4XG1M4Upm8zaXkNTLo2pbl51oKlxBjN50sY5J
         8n8xfTayzBc+2ytPLFuDLXYBwwbC5qFFZa49mbn7QyET3k4edmlDKyWn/j7b+yenApuq
         MpTQ==
X-Gm-Message-State: APuU4Z8ZaqlssdEdls2S85OUdlBgpxGNHnyVjKWDo+8QvIjjnpmUmcYZ
	SmORmp8xHEx2bkmYBQ3uKh4o1urP1JQ4PjD+bjTkSsF0jnuIs68Q/9Rv5VR8aV1k1p5kCGJnaE+
	RM3txFooixEmkZ/eMcRnTwVrFO3xIT6uc5fG+d+9s/lcaB+8aTTe6yfDlCrt7gy60AmTwt2FDal
	UmoA==
X-Gm-Gg: AYBFou3ZV4MwnVheJ8qbBNyR+wjfR80EAZstAgAzH9cDkBR2ft12psOU3cKDhL8up7u
	qFbSwVHnVt82RKUt0yL6onbRF/BXipDUENOQKfQ3+Vq2mTHd/+rnlNzUa10dBAOo5HhT+tMaaFa
	xJGy8gzO4J9h6J567gj5r3BOrJ/+JNn5bdrAuATkix2gzmC3jc7Fa99uoP7AMgKXBe/d61Cinxn
	C388+VMG3W8IcIh8BstYti/4QNxLp/MhdBJBh78BNJPsQBmCX1JiJqJ7SoehpCBqgfrr2fGpjrL
	ylZ6AsNMVKpdeNi5xUUvRH9VB3mCj6n3UmMaXEdvdaN1Eq7EqlwxcaWfbd3w4WakLK7Guoz5Wui
	vDYDLZ1PTO+YgAwN3TCU2EmIANYQZME2f6h9Tl/Dp/4UNMbC49B8ayNJC+rnsLARCfRIuYvZHIF
	v4wk/SxUUfow==
X-Received: by 2002:a05:701a:ccdd:10b0:1b3:af3a:e793 with SMTP id a92af1059eb24-1b543a0e9bcmr1719570c88.0.1794983801976;
        Tue, 17 Nov 2026 22:36:41 -0800 (PST)
X-Received: by 2002:a05:701a:ccdd:10b0:1b3:af3a:e793 with SMTP id a92af1059eb24-1b543a0e9bcmr1719547c88.0.1794983801190;
        Tue, 17 Nov 2026 22:36:41 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:40 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 11/19] wifi: nl80211/cfg80211: add support for NDP response in offload mode
Date: Wed, 18 Nov 2026 12:05:46 +0530
Message-Id: <20261118063554.2260397-12-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd477b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=p-BaYTe5HE0DmCI7z_sA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: RFIRWnrPzBKwZgNLh1PcolsfUl6XLy1t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX/ctCcUjCh2dy
 9gG94fPghcK1RNQDfNyT4XOSlbiwLESn6HUpdB+9p9NypypF+jQM3eAVll4y2qBD7dazFAU/9gQ
 v3mb8EwCq4LI68wyEYOeTU8GcL2yJWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXycIT2LMSFxDu
 oeuAX5zquWoqW/Vo5NKp5kVCtsFr3O38x7pA0ROj1naSaa4+67Ugq73GgPHm3hQZcjPbRvuqq6L
 yWj3atJ+a6OOx0Eg+jZwbHqh4jMaYemaNdHBIif5j4F6A10SBeUwmvFj7hBXrZ/Lm2NUY/Unq1e
 ygiFIDLDCLvrgYEThJystUtuotXzfd8hb2Jomfsf5UnSWUS0N08Fr0Fu3BJCObi3odO1VyHBcKC
 vcGzZjItZ29WhEGz8qFM+W7xkTFDyOWwcwtSnD3Tvk+hlzpZuersfUa6/P1RH0d072GqAhjKkAe
 mMz1usfMvcs9z2z477wfGlr5LOnFW2jGdc0yXWQW7sna7PbNtkkq2Azx3SaTj1DhQvA1AD/Qkiy
 xRj0iKL79gxnWk9ncf3HMtMJE44ThZTWeKiHIxS1NjIeYAXxoKXNwOZf0uO8aotzSLtZIMT5geu
 +IH85y2pulMmMMfaAMQ==
X-Proofpoint-ORIG-GUID: RFIRWnrPzBKwZgNLh1PcolsfUl6XLy1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

Add NL80211_CMD_NAN_NDP_RESPOND so userspace can accept or reject an
incoming NDP request when the device offloads NDP management. Require a
local responder NDI only when accepting; the initiator NDI belongs to
the peer and is not validated as a local interface.

Restrict rejection requests to the reason and optional SSI, and enforce
the NAN security requirements when accepting. Pass PMK material by
pointer, clear the request skb, and trace request parameters without
recording key bytes.

Allow the responder to provide transport port and protocol information
when accepting an NDP request. Accept the NDL QoS requirements on
accepted responses, and reject them when rejecting an NDP.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  63 ++++++++++++
 include/uapi/linux/nl80211.h |  39 +++++++-
 net/wireless/nl80211.c       | 179 +++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      |  16 ++++
 net/wireless/trace.h         |  92 ++++++++++++++++++
 5 files changed, 384 insertions(+), 5 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6b3b46a993a3..5857ce6be50f 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4441,6 +4441,60 @@ struct cfg80211_nan_ndp_initiate {
 	u16 qos_max_latency;
 };
 
+/**
+ * struct cfg80211_nan_ndp_respond - NAN NDP respond parameters
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID from the received NDP Request
+ * @init_ndi: initiator NDI MAC from the received NDP Request
+ * @resp_ndi: responder NDI MAC. The corresponding
+ *	%NL80211_IFTYPE_NAN_DATA interface must exist when accepting.
+ * @accept: if true, accept the NDP; if false, reject it
+ * @reason: Wi-Fi Aware reason code for rejection (valid when @accept is false)
+ * @ssi: response service-specific info (may be NULL)
+ * @ssi_len: length of @ssi
+ * @cipher_suite: NAN cipher suite ID (must match the initiator's)
+ * @pmk: ND-PMK used to derive the PTK; NULL if absent. Its length depends on
+ *	the cipher suite and is given by @pmk_len. Requires non-zero
+ *	@cipher_suite and %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @pmk_len: length of @pmk in bytes
+ * @gtk_required: if true, GTK protection is required for group-addressed data
+ *	frames
+ * @gtk_cipher: GTK cipher suite ID, valid when @gtk_required is true
+ * @ipv6_intf_id: IPv6 link-local interface identifier, or NULL if absent
+ * @transport_info: if true, convey @transport_port and @transport_protocol to
+ *	the peer in the NDPE Service Info TLV (Generic Service Protocol). These
+ *	values are not conveyed if the peer does not support NDPE.
+ * @transport_port: transport port to convey when @transport_info is true
+ * @transport_protocol: IANA protocol number to convey when @transport_info is
+ *	true
+ * @qos_min_slots: minimum number of NAN time slots required for this NDP; 0
+ *	means no preference. Used only when accepting the NDP.
+ * @qos_max_latency: maximum number of NAN slots between two non-contiguous
+ *	NDL CRBs; 0xffff means no preference. Used only when accepting the NDP.
+ */
+struct cfg80211_nan_ndp_respond {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	const u8 *resp_ndi;
+	bool accept;
+	u8 reason;
+	const u8 *ssi;
+	u8 ssi_len;
+	u32 cipher_suite;
+	const u8 *pmk;
+	u8 pmk_len;
+	bool gtk_required;
+	u32 gtk_cipher;
+	const u8 *ipv6_intf_id;
+	bool transport_info;
+	u16 transport_port;
+	u8 transport_protocol;
+	u8 qos_min_slots;
+	u16 qos_max_latency;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -5435,6 +5489,12 @@ struct mgmt_frame_regs {
  *	status notification, including on failure or timeout. If the device cannot
  *	meet the QoS requirements in @params, it reports setup failure with the
  *	Wi-Fi Aware reason QoS_UNACCEPTABLE.
+ * @nan_ndp_respond: Respond to an incoming NDP request as the responder.
+ *	Only valid if the driver has set %WIPHY_NAN_FLAGS_OFFLOAD_NDP. Returning
+ *	success acknowledges the response command only; setup outcome is reported
+ *	asynchronously after the handshake. If the accepted response's QoS
+ *	requirements cannot be met, the driver reports setup failure with the
+ *	Wi-Fi Aware reason QoS_UNACCEPTABLE.
  *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
@@ -5853,6 +5913,9 @@ struct cfg80211_ops {
 	int	(*nan_ndp_initiate)(struct wiphy *wiphy,
 				    struct wireless_dev *wdev,
 				    struct cfg80211_nan_ndp_initiate *params);
+	int	(*nan_ndp_respond)(struct wiphy *wiphy,
+				   struct wireless_dev *wdev,
+				   struct cfg80211_nan_ndp_respond *params);
 	int	(*set_multicast_to_unicast)(struct wiphy *wiphy,
 					    struct net_device *dev,
 					    const bool enabled);
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 33af139c4d4b..1d5e2f2f08ca 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1593,6 +1593,18 @@
  *	Aware reason QoS_UNACCEPTABLE.
  *	Each accepted setup attempt completes asynchronously with exactly one
  *	%NL80211_CMD_NAN_NDP_STATUS notification, including on failure or timeout.
+ * @NL80211_CMD_NAN_NDP_RESPOND: Respond to a received NDP request as
+ *	the responder. Requires %NL80211_NAN_CAPA_OFFLOAD_NDP. The NDI
+ *	interface specified in %NL80211_NAN_NDP_ATTR_RESP_NDI must already
+ *	exist as a %NL80211_IFTYPE_NAN_DATA interface. Carries
+ *	%NL80211_ATTR_NAN_NDP nested with %NL80211_NAN_NDP_ATTR_* fields.
+ *	The command reply only acknowledges that the response was accepted for
+ *	processing; setup outcome is reported asynchronously by
+ *	%NL80211_CMD_NAN_NDP_STATUS.
+ *	Transport port and protocol may be supplied together only when accepting.
+ *	NDL QoS attributes may also be supplied only when accepting. If the device
+ *	cannot meet the QoS requirements in an accepted response, setup fails and
+ *	the status notification reports the Wi-Fi Aware reason QoS_UNACCEPTABLE.
  *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
@@ -1882,6 +1894,7 @@ enum nl80211_commands {
 	NL80211_CMD_COMPLETED_SMD_TRANSITION,
 
 	NL80211_CMD_NAN_NDP_INITIATE,
+	NL80211_CMD_NAN_NDP_RESPOND,
 
 	/* add new commands above here */
 
@@ -8166,6 +8179,8 @@ enum nl80211_nan_conf_attributes {
  *	For locally initiated NDPs, the corresponding
  *	%NL80211_IFTYPE_NAN_DATA interface must exist.
  * @NL80211_NAN_NDP_ATTR_RESP_NDI: ETH_ALEN-byte responder NDI MAC address.
+ *	When accepting with %NL80211_CMD_NAN_NDP_RESPOND, this must identify an
+ *	existing local %NL80211_IFTYPE_NAN_DATA interface.
  * @NL80211_NAN_NDP_ATTR_SSI: binary. Service-specific info carried in
  *	the NDP setup frames.
  * @NL80211_NAN_NDP_ATTR_CIPHER_SUITE: u32 NAN cipher suite ID; 0 for open NDP.
@@ -8186,17 +8201,29 @@ enum nl80211_nan_conf_attributes {
  *	identifier, %NL80211_NAN_NDP_IPV6_INTF_ID_LEN bytes. The driver conveys it
  *	in the NDPE attribute and selects NDP or NDPE based on peer capabilities.
  * @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT: u16 transport port. Must be supplied
- *	with @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL. The driver carries the pair
- *	in the NDPE Service Info TLV (Generic Service Protocol). If the peer does
- *	not support NDPE, the values are not conveyed.
+ *	with @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL. The pair may be used in
+ *	%NL80211_CMD_NAN_NDP_INITIATE and in an accepting
+ *	%NL80211_CMD_NAN_NDP_RESPOND. The driver carries these values in the NDPE
+ *	Service Info TLV (Generic Service Protocol). If the peer does not support
+ *	NDPE, these values are not conveyed.
  * @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL: u8 IANA protocol number. Must be
  *	supplied with @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT.
  * @NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS: optional u8 Minimum Time Slots field
  *	of the NDL QoS attribute, specifying the minimum number of NAN time slots
- *	required for this NDP. Absent or 0 means no preference.
+ *	required for this NDP. Absent or 0 means no preference. Used with
+ *	%NL80211_CMD_NAN_NDP_INITIATE and an accepting
+ *	%NL80211_CMD_NAN_NDP_RESPOND.
  * @NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY: optional u16 Maximum Latency field of
  *	the NDL QoS attribute, specifying the maximum number of NAN slots between
- *	two non-contiguous NDL CRBs. Absent or 0xffff means no preference.
+ *	two non-contiguous NDL CRBs. Absent or 0xffff means no preference. Used
+ *	with %NL80211_CMD_NAN_NDP_INITIATE and an accepting
+ *	%NL80211_CMD_NAN_NDP_RESPOND.
+ * @NL80211_NAN_NDP_ATTR_ACCEPT: flag. If present in
+ *	%NL80211_CMD_NAN_NDP_RESPOND, it accepts the request; if absent, it is
+ *	rejected.
+ * @NL80211_NAN_NDP_ATTR_REASON: u8 Wi-Fi Aware reason code, not an IEEE 802.11
+ *	reason code (%NL80211_ATTR_REASON_CODE). Used for rejection with
+ *	%NL80211_CMD_NAN_NDP_RESPOND.
  * @__NL80211_NAN_NDP_ATTR_LAST: Internal.
  * @NL80211_NAN_NDP_ATTR_MAX: Highest NDP attribute.
  */
@@ -8219,6 +8246,8 @@ enum nl80211_nan_ndp_attributes {
 	NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL,
 	NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS,
 	NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY,
+	NL80211_NAN_NDP_ATTR_ACCEPT,
+	NL80211_NAN_NDP_ATTR_REASON,
 
 	/* keep last */
 	__NL80211_NAN_NDP_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 53cd9d5cd648..74be0f639315 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -845,6 +845,8 @@ nl80211_nan_ndp_policy[NL80211_NAN_NDP_ATTR_MAX + 1] = {
 	[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL] = { .type = NLA_U8 },
 	[NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS] = { .type = NLA_U8 },
 	[NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY] = { .type = NLA_U16 },
+	[NL80211_NAN_NDP_ATTR_ACCEPT] = { .type = NLA_FLAG },
+	[NL80211_NAN_NDP_ATTR_REASON] = { .type = NLA_U8 },
 };
 
 static const struct nla_policy
@@ -18739,6 +18741,176 @@ static int nl80211_nan_ndp_initiate(struct sk_buff *skb,
 	return genlmsg_reply(msg, info);
 }
 
+static int nl80211_nan_ndp_respond(struct sk_buff *skb,
+				   struct genl_info *info)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct wireless_dev *wdev = info->user_ptr[1];
+	struct nlattr *tb[NL80211_NAN_NDP_ATTR_MAX + 1];
+	struct cfg80211_nan_ndp_respond params = {};
+	bool secure_nan;
+	int err;
+
+	if (wdev->iftype != NL80211_IFTYPE_NAN) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP respond requires NAN interface");
+		return -EOPNOTSUPP;
+	}
+
+	if (!(rdev->wiphy.nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_NDP)) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NAN NDP offload not supported by driver");
+		return -EOPNOTSUPP;
+	}
+
+	if (!info->attrs[NL80211_ATTR_MAC] ||
+	    !info->attrs[NL80211_ATTR_NAN_NDP]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP respond requires peer NMI and NDP params");
+		return -EINVAL;
+	}
+
+	err = nla_parse_nested(tb, NL80211_NAN_NDP_ATTR_MAX,
+			       info->attrs[NL80211_ATTR_NAN_NDP],
+			       nl80211_nan_ndp_policy,
+			       info->extack);
+	if (err)
+		return err;
+
+	if (!!tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT] !=
+	    !!tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "Transport port and protocol must be supplied together");
+		return -EINVAL;
+	}
+
+	if (!tb[NL80211_NAN_NDP_ATTR_ID] ||
+	    !tb[NL80211_NAN_NDP_ATTR_INIT_NDI]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP respond requires NDP ID and INIT_NDI");
+		return -EINVAL;
+	}
+
+	params.peer_nmi = nla_data(info->attrs[NL80211_ATTR_MAC]);
+	params.ndp_id = nla_get_u8(tb[NL80211_NAN_NDP_ATTR_ID]);
+	params.init_ndi = nla_data(tb[NL80211_NAN_NDP_ATTR_INIT_NDI]);
+	params.accept = nla_get_flag(tb[NL80211_NAN_NDP_ATTR_ACCEPT]);
+	params.qos_max_latency = U16_MAX;
+
+	if (params.accept) {
+		if (tb[NL80211_NAN_NDP_ATTR_REASON]) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_NAN_NDP_ATTR_REASON],
+					    "REASON is only valid when rejecting");
+			return -EINVAL;
+		}
+
+		if (!tb[NL80211_NAN_NDP_ATTR_RESP_NDI]) {
+			NL_SET_ERR_MSG(info->extack,
+				       "NDP accept requires RESP_NDI");
+			return -EINVAL;
+		}
+		params.resp_ndi = nla_data(tb[NL80211_NAN_NDP_ATTR_RESP_NDI]);
+		if (!nl80211_nan_ndi_exists(rdev,
+					    params.resp_ndi)) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_NAN_NDP_ATTR_RESP_NDI],
+					    "RESP_NDI must identify an existing NAN Data interface");
+			return -ENODEV;
+		}
+
+		if (tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT]) {
+			params.transport_info = true;
+			params.transport_port =
+				nla_get_u16(tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT]);
+			params.transport_protocol =
+				nla_get_u8(tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL]);
+		}
+
+		if (tb[NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS])
+			params.qos_min_slots =
+				nla_get_u8(tb[NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS]);
+
+		if (tb[NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY])
+			params.qos_max_latency =
+				nla_get_u16(tb[NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY]);
+	} else {
+		if (tb[NL80211_NAN_NDP_ATTR_RESP_NDI] ||
+		    tb[NL80211_NAN_NDP_ATTR_CIPHER_SUITE] ||
+		    tb[NL80211_NAN_NDP_ATTR_PMK] ||
+		    tb[NL80211_NAN_NDP_ATTR_GTK_REQUIRED] ||
+		    tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER] ||
+		    tb[NL80211_NAN_NDP_ATTR_IPV6_INTF_ID] ||
+		    tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT] ||
+		    tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL] ||
+		    tb[NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS] ||
+		    tb[NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY]) {
+			NL_SET_ERR_MSG(info->extack,
+				       "RESP_NDI, cipher, PMK, GTK, IPv6 IID, transport info and QoS are only valid when accepting");
+			return -EINVAL;
+		}
+
+		if (tb[NL80211_NAN_NDP_ATTR_REASON])
+			params.reason =
+				nla_get_u8(tb[NL80211_NAN_NDP_ATTR_REASON]);
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_SSI]) {
+		params.ssi = nla_data(tb[NL80211_NAN_NDP_ATTR_SSI]);
+		params.ssi_len = nla_len(tb[NL80211_NAN_NDP_ATTR_SSI]);
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_CIPHER_SUITE])
+		params.cipher_suite =
+			nla_get_u32(tb[NL80211_NAN_NDP_ATTR_CIPHER_SUITE]);
+
+	secure_nan = wiphy_ext_feature_isset(&rdev->wiphy,
+					     NL80211_EXT_FEATURE_SECURE_NAN);
+	if (params.cipher_suite && !secure_nan) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    tb[NL80211_NAN_NDP_ATTR_CIPHER_SUITE],
+				    "NDP cipher suite requires SECURE_NAN");
+		return -EOPNOTSUPP;
+	}
+
+	if ((tb[NL80211_NAN_NDP_ATTR_PMK] ||
+	     tb[NL80211_NAN_NDP_ATTR_GTK_REQUIRED]) &&
+	    (!secure_nan || !params.cipher_suite)) {
+		NL_SET_ERR_MSG(info->extack,
+			       "PMK and GTK require SECURE_NAN and a non-zero cipher suite");
+		return -EINVAL;
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_PMK]) {
+		params.pmk = nla_data(tb[NL80211_NAN_NDP_ATTR_PMK]);
+		params.pmk_len = nla_len(tb[NL80211_NAN_NDP_ATTR_PMK]);
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_GTK_REQUIRED]) {
+		if (!tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER]) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_NAN_NDP_ATTR_GTK_REQUIRED],
+					    "GTK_CIPHER is required when GTK_REQUIRED is set");
+			return -EINVAL;
+		}
+
+		params.gtk_required = true;
+		params.gtk_cipher =
+			nla_get_u32(tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER]);
+	} else if (tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER]) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER],
+				    "GTK_CIPHER requires GTK_REQUIRED");
+		return -EINVAL;
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_IPV6_INTF_ID])
+		params.ipv6_intf_id =
+			nla_data(tb[NL80211_NAN_NDP_ATTR_IPV6_INTF_ID]);
+
+	return rdev_nan_ndp_respond(rdev, wdev, &params);
+}
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
@@ -22058,6 +22230,13 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
 					 NL80211_FLAG_CLEAR_SKB),
 	},
+	{
+		.cmd = NL80211_CMD_NAN_NDP_RESPOND,
+		.doit = nl80211_nan_ndp_respond,
+		.flags = GENL_ADMIN_PERM,
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
+					 NL80211_FLAG_CLEAR_SKB),
+	},
 };
 
 static struct genl_family nl80211_fam __ro_after_init = {
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index e60478a25a31..c58b83210d60 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1205,6 +1205,22 @@ rdev_nan_ndp_initiate(struct cfg80211_registered_device *rdev,
 	return ret;
 }
 
+static inline int
+rdev_nan_ndp_respond(struct cfg80211_registered_device *rdev,
+		     struct wireless_dev *wdev,
+		     struct cfg80211_nan_ndp_respond *params)
+{
+	int ret;
+
+	if (!rdev->ops->nan_ndp_respond)
+		return -EOPNOTSUPP;
+
+	trace_rdev_nan_ndp_respond(&rdev->wiphy, wdev, params);
+	ret = rdev->ops->nan_ndp_respond(&rdev->wiphy, wdev, params);
+	trace_rdev_return_int(&rdev->wiphy, ret);
+	return ret;
+}
+
 static inline int rdev_set_mac_acl(struct cfg80211_registered_device *rdev,
 				   struct net_device *dev,
 				   struct cfg80211_acl_data *params)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 26e966c743c8..8c5fdbe23747 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2645,6 +2645,98 @@ TRACE_EVENT(rdev_nan_ndp_initiate,
 #undef RDEV_NAN_NDP_INITIATE_FMT_4
 #undef RDEV_NAN_NDP_INITIATE_FMT_5
 
+#define NDP_RESP_FMT_1 \
+	", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, "
+#define NDP_RESP_FMT_2 \
+	"resp_ndi: %pM, accept: %d, reason: %u, ssi_len: %u, ssi: %s, "
+#define NDP_RESP_FMT_3 \
+	"cipher_suite: %u, pmk_len: %u, gtk_required: %d, gtk_cipher: %u, "
+#define NDP_RESP_FMT_4 \
+	"ipv6_intf_id_present: %d, ipv6_intf_id: %s, " \
+	"qos_min_slots: %u, qos_max_latency: %u"
+
+TRACE_EVENT(rdev_nan_ndp_respond,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 struct cfg80211_nan_ndp_respond *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__array(u8, resp_ndi, ETH_ALEN)
+		__field(bool, accept)
+		__field(u8, reason)
+		__field(u8, ssi_len)
+		__dynamic_array(u8, ssi, params->ssi_len)
+		__field(u32, cipher_suite)
+		__field(u8, pmk_len)
+		__field(bool, gtk_required)
+		__field(u32, gtk_cipher)
+		__field(bool, transport_info)
+		__field(u16, transport_port)
+		__field(u8, transport_protocol)
+		__field(bool, ipv6_intf_id_present)
+		__array(u8, ipv6_intf_id, NL80211_NAN_NDP_IPV6_INTF_ID_LEN)
+		__field(u8, qos_min_slots)
+		__field(u16, qos_max_latency)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		memcpy(__entry->peer_nmi, params->peer_nmi, ETH_ALEN);
+		__entry->ndp_id = params->ndp_id;
+		memcpy(__entry->init_ndi, params->init_ndi, ETH_ALEN);
+		if (params->resp_ndi)
+			memcpy(__entry->resp_ndi, params->resp_ndi, ETH_ALEN);
+		else
+			memset(__entry->resp_ndi, 0, ETH_ALEN);
+		__entry->accept = params->accept;
+		__entry->reason = params->reason;
+		__entry->ssi_len = params->ssi_len;
+		if (params->ssi && params->ssi_len)
+			memcpy(__get_dynamic_array(ssi), params->ssi,
+			       params->ssi_len);
+		__entry->cipher_suite = params->cipher_suite;
+		__entry->pmk_len = params->pmk ? params->pmk_len : 0;
+		__entry->gtk_required = params->gtk_required;
+		__entry->gtk_cipher = params->gtk_cipher;
+		__entry->transport_info = params->transport_info;
+		__entry->transport_port = params->transport_port;
+		__entry->transport_protocol = params->transport_protocol;
+		__entry->ipv6_intf_id_present = !!params->ipv6_intf_id;
+		if (params->ipv6_intf_id)
+			memcpy(__entry->ipv6_intf_id, params->ipv6_intf_id,
+			       NL80211_NAN_NDP_IPV6_INTF_ID_LEN);
+		else
+			memset(__entry->ipv6_intf_id, 0,
+			       NL80211_NAN_NDP_IPV6_INTF_ID_LEN);
+		__entry->qos_min_slots = params->qos_min_slots;
+		__entry->qos_max_latency = params->qos_max_latency;
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  NDP_RESP_FMT_1 NDP_RESP_FMT_2 NDP_RESP_FMT_3 NDP_RESP_FMT_4
+		  ", transport_info: %d, transport_port: %u, transport_protocol: %u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->peer_nmi, __entry->ndp_id,
+		  __entry->init_ndi, __entry->resp_ndi, __entry->accept,
+		  __entry->reason, __entry->ssi_len,
+		  __print_array(__get_dynamic_array(ssi), __entry->ssi_len,
+				sizeof(u8)),
+		  __entry->cipher_suite, __entry->pmk_len,
+		  __entry->gtk_required, __entry->gtk_cipher,
+		  __entry->ipv6_intf_id_present,
+		  __print_array(__entry->ipv6_intf_id,
+				NL80211_NAN_NDP_IPV6_INTF_ID_LEN, sizeof(u8)),
+		  __entry->qos_min_slots, __entry->qos_max_latency,
+		  __entry->transport_info, __entry->transport_port,
+		  __entry->transport_protocol)
+);
+#undef NDP_RESP_FMT_1
+#undef NDP_RESP_FMT_2
+#undef NDP_RESP_FMT_3
+#undef NDP_RESP_FMT_4
+
 TRACE_EVENT(rdev_set_mac_acl,
 	TP_PROTO(struct wiphy *wiphy, struct net_device *netdev,
 		 struct cfg80211_acl_data *params),
-- 
2.34.1

