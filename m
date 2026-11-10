Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285208;
	b=yYDdFtw+bMbUucQQ5jzxUvPB2rbhYWXiLD2PH7BqcuXuncxweJR83EgpJ2/fFYilHqWp
	 /4gD6nWyWT2o+SEqdUQfuQPLCYMAsVk80KKdzsYZVfZzhivC4nNISjgde80PYG5AZCzMF
	 i/sN8cvXBo1MJDzc+87KOWsa2+v3DouDokHwPH+7MvT+QiYKIMbNERHpeFV49DKU+t6rK
	 vCrZ40f6+CfAEbsVYJcNAIXzs5W/LHj54nf/cUFwZbA3y9s4VpKcycns0VpC100bMfnk9
	 Ib2OMjq5Nlv0gQMGwALSO5XvqoYO5EBt3/POZJiDC4zyrtkYhngAgpTTcNM3NaOkcug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3gzhYqF0RryG/AldOXVJ1KmFW/l8XhH095HfTHyREdY=;
	b=dinLOBAlBF+jZyP89N3MoA40JRsR279525Ed0Z43oGUeCl5dEov/C2iTqJS3YrlbW2Ay
	 m1zNiNVivR6Ef038z2sR1iIMdbE1O2N1NQpAmKhgKg5K7DKst+AhFjF/kVTb9eGahiyJ7
	 8XUOFhisAZPwCKe7gtVOZ/8f6SyRoYl29V7ddpkbKUQz8hVGFU4XjJ7htBkaBA7c0FZ+c
	 RGwF+CZLer7vPq0Yp47G/apuOgxNJEsz9XJ29jlcIK77gZAd9k8BkhMh14pkJjAIhZbH5
	 +ND1/eAAJ+V+DZ89kNM06XjffEN9BRpFIJ7dXKqLj4OclzPoR82EthtgBvvH3nDUN4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGVTehQn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VChIAwIv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE484606A32E
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE484606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGVTehQn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VChIAwIv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AARd2919669
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3gzhYqF0Rry
	G/AldOXVJ1KmFW/l8XhH095HfTHyREdY=; b=fGVTehQnH/kMB/lM1+At/qDKnPD
	S+6pf1vbal0MhpP9n1CW+Gt64Wonn68yaWreRLAIpnKBYYMLXuXjUpTUEItucP8n
	85R7Jyb6mQy7WKGUe0U6XmgFzQcxh46eDTPVQ7tnvu26GFaI/RlJoZ+2JtbiJZgQ
	rcVzXlSuUvGuyavANabs/gbZrC26325/58mT73gaio6e0ee84BFL1ys0+2tRl6/F
	JVxpq65IoRGg225FIMTRoZAT7Hgb/cnzzwn2ZQGXal/rtiPDLh36cR1QvnXkO+tr
	z/THCoqVwwYWu+aupYXQFfQDR941QwftYdav/Zvays9V3D1zj/YgzHZiNEQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg1nrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so563300eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285206; x=1794890006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gzhYqF0RryG/AldOXVJ1KmFW/l8XhH095HfTHyREdY=;
        b=VChIAwIv19GWKDz+2EpofnDw9qO9hhFabBRqEUZkdJYc/OJqpzWgHbHZLLQR2NK3Gn
         /YwXhM178v1B+o+zwu+dYiQOFmSnN1BJvdmprn0LrfQYCoYyLqactOkgABnpQsHaR8uB
         8TCokaCjzlrTViIpJBlWBJ8UyXP152Q/JYf/REAQwMOD5e4yl+Ipo4bkDYd4kPgV5FA9
         wv+RoCqeLLhy7OeeUPCIwRIm16pX2aUMTIlsSr2mC/rFGY9PP/saQDk8tIIdSTxYgaSY
         9rux86/iqy5OFSHBR2D6tG3O4lTqvxuZ9IuLRd15dGbouXGJklGDGcr0/glrdq+jRm2u
         MCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285206; x=1794890006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gzhYqF0RryG/AldOXVJ1KmFW/l8XhH095HfTHyREdY=;
        b=qZzgKuel8UhIwmqAJYdggAAIcyaBcqwVHBg9HLN6NqJP7bnstSofwHC1cQN1GsmnAq
         Hs4WQwUZVbqaJhtTbpIPjFlNHw1cJw7hmCQaWAelQWsO5jThhK/ZdWPtwge3vy2Ku9+L
         c3/Suqohqms9XRqip5kGNw2KjXXlIGWsRFAkPq/2w0gGbrK0lwalKObWX0XiXmS8EDlS
         PAHXIh3qtcSC5aridJKKUxnxBYAGQqxF+Wx1/q21liKUgMuUiIUXw3Ao7W0fLlZYDW+G
         HWEZYwBH2WeuuttLghtyrPhaqO9FE3aUlwEDcUB2iuDCCWEXPfZcfDPY5PYPNHBU6s/o
         EuFQ==
X-Gm-Message-State: APuU4Z9Pq4cIkSZVFu+ugq2L0SwujFSfv7/cHjsEk18DFmlWys/hyYR4
	G8nhCx+brQzHmKdgag+vpc5DvIKv6SQ0xM7SQ/G+heiRMQeRKWBhA+CgKGBR5jc20KYdopiYAjB
	AFtNwnBTI9nk7OUb49QTNdAXxp9CpUzUm7Vi6El3Jrzx8RvOrs3inKIu7WAB15BgSryrtow==
X-Gm-Gg: AYBFou2Zbn0tXVEBfrk9g5IaITos3g14GmT/u+JBPvSc/Hw7661sYDszJJbLN/U2hG6
	trZ5UV65pEJcKj51XMQbX7MtA1Ui5SwGbvrpiX1gwdHk4rziPL97M238zHCruHfm/z3hJ11JUDY
	mB9G9fomaY/KTOQ1Wga1PqDfyilFFhpFHHaZCr57Yr4fXszaJ5GhtS3DDTF00kwzyMBKB0qfS7s
	Auko91bkA0bYPujUvWAWEPreawrV0fIGv12eSbJ9vncjSIT9Ru/3ejzFSve9JPJ+CxRFrn8+852
	ikkwPinaMJQ0dcKdMoelndekugrGn9I9iyDY8YnKPIVO9bc4Ith6pY56c434FM/RaOd8dW2LpYM
	Ni/LSXDb8h8KtI1/A79JkZlbf42V4TSHPDmAxiw4Xz7miAq1hNw26MJyucU4F/weeG+e8cWw2dX
	HOg7jaMZtQtQ==
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1948917eec.21.1794285205045;
        Mon, 09 Nov 2026 20:33:25 -0800 (PST)
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1948871eec.21.1794285204321;
        Mon, 09 Nov 2026 20:33:24 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:23 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 11/19] wifi: nl80211/cfg80211: add support for NDP response in offload mode
Date: Tue, 10 Nov 2026 10:02:34 +0530
Message-Id: <20261110043242.2012238-12-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX/HsHQ7Qxn9XT
 8Cue1D1jZ2sHjoTvpIHB2WTpS+j3nB/DyLzdTEK6XAMxMhUl/fSY49889rGNy2lIIw284j6gZEK
 PyBj1o0kcY1/d8DsrJvl79x6yw0tQzbCNFg7NEqyUw1psr3PgTlteYKriwiJDWTzaK6rcef1Dte
 4hYndXjyGb+K876zKbyrifNLqRvnyk0Ga7gwP7d2ziakw/0XP3hKdsO3I66bP/zksCwbiZQ4qdx
 /Zl8T9t1UvPPmwoqMEYjW1FcUm6ZdMcYVRh0LdS1V53duIGCMKhIJ897RYfsbOezKhD5InbI42f
 xlU+suC3DdiQ3CNpsW7oW0TMkrH6TK/dTGPtLKRELCNwohkVcdORGi1+RgGzTW0o1FJxLNv1hW3
 azVbNtPkPlz2wJE3tjMjub/Uc6Y6J0HGYe9yiIhLDmBlC0nTSloejuepQ6ct1/VjwJzGfXw5Gx1
 TdlLMDBelNHOXR7CBeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX11PCcb8NhLwC
 FozgMR48iyL59mBTN6BnVTWQifhNSFx8DAtcs2L1xmguESJegZlVJOI43gNEkGpX43184XqxhHU
 CB0a25XtG9oGKyPAZZfuR5ptHy9xz14=
X-Proofpoint-GUID: HFdLYRCHoulFFjnhs9HzEFSjibTEj-2j
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af29e96 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eqyLMRoqvRkuQS9_NpoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: HFdLYRCHoulFFjnhs9HzEFSjibTEj-2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100017

Add NL80211_CMD_NAN_NDP_RESPOND so userspace can accept or reject an
incoming NDP request when the device offloads NDP management. Require a
local responder NDI only when accepting; the initiator NDI belongs to
the peer and is not validated as a local interface.

Restrict rejection requests to the reason and optional SSI, and enforce
the NAN security requirements when accepting. Pass PMK material by
pointer, clear the request skb, and trace request parameters without
recording key bytes.

Allow the responder to provide transport port and protocol information
when accepting an NDP request. Reject channel request attributes on the
response command, since channel selection is requested by the initiator.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  55 +++++++++++
 include/uapi/linux/nl80211.h |  28 +++++-
 net/wireless/nl80211.c       | 175 +++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      |  16 ++++
 net/wireless/trace.h         |  86 +++++++++++++++++
 5 files changed, 357 insertions(+), 3 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index eb753c83722e..151555fa8404 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4395,6 +4395,54 @@ struct cfg80211_nan_ndp_initiate {
 	bool chan_forced;
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
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -5384,6 +5432,10 @@ struct mgmt_frame_regs {
  *	specify a channel, drivers advertising NDP offload must honor it as a
  *	channel preference. If the channel is forced and cannot be included in the
  *	NDL, the driver must fail the request.
+ * @nan_ndp_respond: Respond to an incoming NDP request as the responder.
+ *	Only valid if the driver has set %WIPHY_NAN_FLAGS_OFFLOAD_NDP. Returning
+ *	success acknowledges the response command only; setup outcome is reported
+ *	asynchronously after the handshake.
  *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
@@ -5795,6 +5847,9 @@ struct cfg80211_ops {
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
index d6b601556248..bdd52fcafe85 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1503,6 +1503,15 @@
  *	failure with %NL80211_CMD_NAN_NDP_STATUS. The device chooses the bandwidth.
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
  *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
@@ -1787,6 +1796,7 @@ enum nl80211_commands {
 	NL80211_CMD_UPDATE_BEACON,
 
 	NL80211_CMD_NAN_NDP_INITIATE,
+	NL80211_CMD_NAN_NDP_RESPOND,
 
 	/* add new commands above here */
 
@@ -8071,6 +8081,8 @@ enum nl80211_nan_conf_attributes {
  *	For locally initiated NDPs, the corresponding
  *	%NL80211_IFTYPE_NAN_DATA interface must exist.
  * @NL80211_NAN_NDP_ATTR_RESP_NDI: ETH_ALEN-byte responder NDI MAC address.
+ *	When accepting with %NL80211_CMD_NAN_NDP_RESPOND, this must identify an
+ *	existing local %NL80211_IFTYPE_NAN_DATA interface.
  * @NL80211_NAN_NDP_ATTR_SSI: binary. Service-specific info carried in
  *	the NDP setup frames.
  * @NL80211_NAN_NDP_ATTR_CIPHER_SUITE: u32 NAN cipher suite ID; 0 for open NDP.
@@ -8091,9 +8103,11 @@ enum nl80211_nan_conf_attributes {
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
  * @NL80211_NAN_NDP_ATTR_CHANNEL_FREQ: optional u32 channel frequency in MHz.
@@ -8106,6 +8120,12 @@ enum nl80211_nan_conf_attributes {
  *	@NL80211_NAN_NDP_ATTR_CHANNEL_FREQ. The requested channel must be included
  *	in the NDL. If it cannot be used, for example because it is incompatible
  *	with peer availability, setup fails.
+ * @NL80211_NAN_NDP_ATTR_ACCEPT: flag. If present in
+ *	%NL80211_CMD_NAN_NDP_RESPOND, it accepts the request; if absent, it is
+ *	rejected.
+ * @NL80211_NAN_NDP_ATTR_REASON: u8 Wi-Fi Aware reason code, not an IEEE 802.11
+ *	reason code (%NL80211_ATTR_REASON_CODE). Used for rejection with
+ *	%NL80211_CMD_NAN_NDP_RESPOND.
  * @__NL80211_NAN_NDP_ATTR_LAST: Internal.
  * @NL80211_NAN_NDP_ATTR_MAX: Highest NDP attribute.
  */
@@ -8128,6 +8148,8 @@ enum nl80211_nan_ndp_attributes {
 	NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL,
 	NL80211_NAN_NDP_ATTR_CHANNEL_FREQ,
 	NL80211_NAN_NDP_ATTR_CHANNEL_FORCED,
+	NL80211_NAN_NDP_ATTR_ACCEPT,
+	NL80211_NAN_NDP_ATTR_REASON,
 
 	/* keep last */
 	__NL80211_NAN_NDP_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index fb1190a60748..85b8181b7c68 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -826,6 +826,8 @@ nl80211_nan_ndp_policy[NL80211_NAN_NDP_ATTR_MAX + 1] = {
 	[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL] = { .type = NLA_U8 },
 	[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ] = { .type = NLA_U32 },
 	[NL80211_NAN_NDP_ATTR_CHANNEL_FORCED] = { .type = NLA_FLAG },
+	[NL80211_NAN_NDP_ATTR_ACCEPT] = { .type = NLA_FLAG },
+	[NL80211_NAN_NDP_ATTR_REASON] = { .type = NLA_U8 },
 };
 
 static const struct nla_policy
@@ -18751,6 +18753,172 @@ static int nl80211_nan_ndp_initiate(struct sk_buff *skb,
 	return -ENOBUFS;
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
+	if (tb[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ] ||
+	    tb[NL80211_NAN_NDP_ATTR_CHANNEL_FORCED]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "Channel request is only valid with NDP initiate");
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
+	} else {
+		if (tb[NL80211_NAN_NDP_ATTR_RESP_NDI] ||
+		    tb[NL80211_NAN_NDP_ATTR_CIPHER_SUITE] ||
+		    tb[NL80211_NAN_NDP_ATTR_PMK] ||
+		    tb[NL80211_NAN_NDP_ATTR_GTK_REQUIRED] ||
+		    tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER] ||
+		    tb[NL80211_NAN_NDP_ATTR_IPV6_INTF_ID] ||
+		    tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT] ||
+		    tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL]) {
+			NL_SET_ERR_MSG(info->extack,
+				       "RESP_NDI, cipher, PMK, GTK, IPv6 IID, transport info only valid when accepting");
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
@@ -21919,6 +22087,13 @@ static const struct genl_small_ops nl80211_small_ops[] = {
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
index df8ec338e59d..d65dd39a1bcb 100644
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
index 131fb5657004..7888a2c8d256 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2646,6 +2646,92 @@ TRACE_EVENT(rdev_nan_ndp_initiate,
 #undef RDEV_NAN_NDP_INITIATE_FMT_4
 #undef RDEV_NAN_NDP_INITIATE_FMT_5
 
+#define NDP_RESP_FMT_1 \
+	", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, "
+#define NDP_RESP_FMT_2 \
+	"resp_ndi: %pM, accept: %d, reason: %u, ssi_len: %u, ssi: %s, "
+#define NDP_RESP_FMT_3 \
+	"cipher_suite: %u, pmk_len: %u, gtk_required: %d, gtk_cipher: %u, "
+#define NDP_RESP_FMT_4 \
+	"ipv6_intf_id_present: %d, ipv6_intf_id: %s"
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

