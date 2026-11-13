Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565400;
	b=GbPBfHntQD2PdzXUiQWVi7I2RM0zvycPOBAKGNldSVYtp9E8Sy1pIOhALw06+77L5Dw/
	 c+DZDlKMWPv1b1Kt87IBzbPzP/35/xPhz+hD+/pmAgy3A2JbBmqw1b37xt6B7VwTTE3Xd
	 IOImk0xQMlrpoXox+az3UNLZgyhpfzVHSFx0f1hrWRRBMHSIMVA9zZ5A35tne5mJFPm3x
	 boQT6f7qN/9PrQ+go6tX50cvbGB11Kr1KmJDjJ6XvSH7tvj4miKDgrqiSazDTicS6guY0
	 GcpE8y4NQ/6eTwNrpfdGLoiTc4Bl1hybhX32m3ETpdzuba5jmrcg4nmJOlRRT84gbYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1oLVRSyZUqXnzwkrKAF4Lyb2SfHQpMc5JGXALXu9ACE=;
	b=e/IvhK5ybkkOE7N/i0EjSa4On3+RsGcjpHetFVazxZhZY68YL3Dd2do2AMcGeBval6GU
	 FQmf8Hpg/dawnxM3VKMQ9oCggIVe5I7a1/Ti63Xa2tTDMkBSfac5v3Lohtomm8NjO/UMz
	 Zd4nbuikqCLC6H8vfU1HFFJpM0uy9cjngoWZc6lyonAACK3INanmu0jsg3JdL9KCKnWPT
	 YAqHHAK1t/bNnJuWnGOwOuJlNySNqDNARjWSa4dFjj88N68skMUg8DNr1st1O9RMg78VG
	 FIhkOkQVXYzo3DpdpWiJXZvEVsgxqVL82wMqz1RaSPtAwHZNigryEWClvVqLQnegKCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YXI2wUUF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ATMAZK8t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C441E606A335
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C441E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YXI2wUUF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ATMAZK8t
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VS2e1527726
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1oLVRSyZUqX
	nzwkrKAF4Lyb2SfHQpMc5JGXALXu9ACE=; b=YXI2wUUFgD5CVSYQ/BvHUwfHXyU
	ajJEKIoJlcDO+erGQmfxrmK3qSzVctcYh6piXSaBRoyE1miLvGvB1vTMdUTbkWoG
	q1nT9lI8Aumxt2by9iZFbb4W9ANozgQKHaoGz9Jkycddo4iU3CD+t87nxnkKHAgk
	EbvMA9oUxJ/c4fkrOpxHVYeJAHw6o4avLzwiXYwI4vvDwYj8ZB4Rx9vD5P/j0e5v
	0SiikMETWRQffMDTSf+2p2Sz9KpqEA7zxT3AamRJkp2Ce/r9f3QvtwedsO7U9HQ/
	6acM6TS6/FQwXdslMI/gTZtkaFijHr900SG3yahesaly/5Y0FlVkEZfKcTg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8tft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso3744402eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565397; x=1795170197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oLVRSyZUqXnzwkrKAF4Lyb2SfHQpMc5JGXALXu9ACE=;
        b=ATMAZK8ta+RqGN0k2vf3POw2hePoBoUMiAtNeXBisHFrzeNlaeN5ZHNYZ3QIFdnjN9
         1Fw0v8HJlp9onxlP5G3p+EgIweGccyXZfgoDW6tvnPbJ2RgQUTQ4yx7l2Nqcibqw+nJz
         s2Nm/4nruCvDaMrIsz5jp3t7Ero5XyhpYEi/UuJ+ftCEnj1r72W0enY9KHuJ5hahhdsW
         q70jBCu4X4sTcMPpK9nNRKszKHau5wJQ/XyAM9vtgJI9h8rMuo0jcq4gTxVFQp+EMEXb
         EvRDGsgLTu+Aw40gNKA0P1SDrwnH3Sj0McBj/VA5ZYecD+jLWeE1JjpKbuKlAYFhExDc
         Nbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565397; x=1795170197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oLVRSyZUqXnzwkrKAF4Lyb2SfHQpMc5JGXALXu9ACE=;
        b=ll7I15A+W0DWKw130fDCwogPLoxPwnC11/TtKVfysMlQXz517lgU5rjAcoijVCN9Yl
         aNZDpfExv/meOTyGganZP47s4qgBnvHahOqDYUJCjQ3CgbSvjCZtwZpRdzAmtmqo1+mw
         cc3y46dy6qqQDXVQjk78JOyxEWJk8m64AG/7JckkUmK3xQIIqRI8A4fdBm3yLRH0YpNu
         GtNPTqKnP4/KEExOA5ToC9C5U9EOCMvkwlsINYCoPVrK/TT28QtwDQ0Y00epgbyHKkki
         bBeLpqWdzYqahi0+YU/l2SuHd0GetYZFRJrAzRZHGDECl9q2qqYqQ41Hi2U30oYkAvH0
         CZog==
X-Gm-Message-State: APuU4Z/VzK97/AtNtM8ZTqXIzfYMH3nAlkICwGXYsT6dhps3Y3YE7DOd
	5TLxTJL6GTL9aCivtGAM6P3LSf5ZUcOHb6dsrIFCJ94oA94mtbkKmnKrKuW7eGpAtEwPufuVfOD
	xqjialZlOPpuJUTgp2woG5WSn+eQlwwLBGuSdDDfxENkiSmu5KnDDLn4KsM0xmKUWif1nxA==
X-Gm-Gg: AYBFou2BWF7u6728VOxXT081bOX1XHKTXfWrxb3wdCnXqcXhoY55dsUUNU42SAK4les
	hldUuKejSpwIGSDNrAHxBHpMFWrUlrVzdtyHYVg7z4AhyZEZknOg+3PPKjQGBU7BTjXxrLdXeD8
	QDiGG1XHKhhn4HlltVzOrLrRXeK8dG/9wVXGcwYWRwiY7WBzMTAMVm/T0qayw/sl38X/1zir04K
	f3dtS1fuQvlJU8uf7rqePKXplvKbgPAXigVynU1zn/wxMPZjwrp+Icyv9g5OCscDBhXM3NtkHE7
	hh02mrzQ9h8ecFlIbOsYVORb8DiRr7JcLB/hZFnFIXt3thlAifeuoPZh5JqR6cLW7rub/VIP1Uz
	rDQW7A+oLHkKS36TSaqUsh1ktHnMryoWcfn39V7BZJRfaGxzYu5WSFNp519Fb6eqbeqXTqWatD/
	55Z0N6xc+94Lk=
X-Received: by 2002:a05:693c:80cf:b0:36e:9773:84b9 with SMTP id 5a478bee46e88-379673132d2mr1787203eec.23.1794565397323;
        Fri, 13 Nov 2026 02:23:17 -0800 (PST)
X-Received: by 2002:a05:693c:80cf:b0:36e:9773:84b9 with SMTP id 5a478bee46e88-379673132d2mr1787179eec.23.1794565396674;
        Fri, 13 Nov 2026 02:23:16 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:16 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 11/19] wifi: nl80211/cfg80211: add support for NDP response in offload mode
Date: Fri, 13 Nov 2026 15:52:20 +0530
Message-Id: <20261113102228.1917973-12-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX01VhA6pAtbgf
 CKeDo9zcuOG4nEvLEm11MRufQh+PxTLgboCpxZYJqu7xnRsl+rU5DU5KxTM6j7QbJhc5rLojJRC
 7tLyx4tVLLsMXBnfpHno3EfzzbfJu/4RSAiY5+NH4KRYMaBDq+r82wGtcxEG/0AWAycy3JcsHn/
 daIwecAbkcfRJOU6isk3Z9yDEDnebyOktdfVLw7V2OEuANkEkhE97Z+GBtYunbutlBNUoWNjIGi
 1pkauDm+2d2cOA6kzjoCBVxT9SSacL70BthraUOaE2ClsTR1zhFTMYDTW8/tkfjkTyM+be4NA5Y
 /gnR4IVFBhUAD+xa9IsOj8sqeu6/FY4WMIx8bXo6Mdl7L4Wtyfa96Tw04CYKWJMAtUDOMfoyeUy
 TBi/y1sLFbgE10st3ec7XhV09X0bfgqGc0oxO2BMPyuh60N3Lq9UniSxIhhCoq9uxHq8NWZR5pv
 9fWk8m664rXnQbYcyFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXwk0d5qRDXm4G
 78fXXBuyQ9oSf4Qw37oZVJ7NkWEJ+SrJj+CC9JKDMd/Sk96kdPhy/C2VKsuPJq6/yP9/t3tv57Q
 jOKvKKsxiF65h/dUPtWNf22OkJFGxQw=
X-Proofpoint-ORIG-GUID: iZWEvk_kfgYKHDdJpesyXJJT_qwM2b2M
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6e516 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=p-BaYTe5HE0DmCI7z_sA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: iZWEvk_kfgYKHDdJpesyXJJT_qwM2b2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

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

