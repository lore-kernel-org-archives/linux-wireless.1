Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983809;
	b=P37aPM3fjbVsdmSb0/cGcJkCQE76Eqfd5RtVxnmlr/vnkEdAeAvhiC12zdpNYAG0mYi3
	 dFHQoP70pdpx9QvVy6BbunGOdNW3t2AzPNLKq4c6VpRjWLlI8YmMQyGhU6AyXcBYccXpF
	 RrYlLTlMRILYSDyr31bzdzqv4cAANHBbAef7VKuZKF8zSPshUmWiEjrhVg3+US5tfWyzL
	 krkfiqguqHSPBgJSBtFCdRf+vxO/akvkFeAA4QoTJ+e6HeB1tGCk4udn3qHtrI1J54ar3
	 ecnwqhpR7uWe+GNLcNAbSk+dVgQrGyXm8cjiAqvF8ZcN0Z22sM6QAnjwhZRJ38bO/bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f4vJSRhDZHyS73+zYMlmwHlpixBWEVvFN4R+HULRvrM=;
	b=OgsBLCUt9hLNgI9tBEwcvTiSnZjl+RtyiuU9MdnQZDjAfQbniR7h3s5tKRcy7PzuoRHg
	 R0Lpxezm8OjWUayhs9OEfJeBCoKJddPkmh6HbgtJ6WuoIZ3dwrR7DDfT8nrndSoLFzWj0
	 tNneNCD4qpHyj6q30jcZlMkBi0b6oSyMlYCxikyLso6eHAN6sHImBclRSKMvZSyguT0+n
	 dZtD84XB1Vbuv2CvyToPcMVuv7d3Feje5RSL+A1YX0IQWp/ZfEBkZayER1w8nMMaT2SkR
	 sxjWRKkPK/LyFnjpz2afokkRwubYy4utdWALZD6NrRveDLA0LwVZN+bvHY9CCjKHGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kprek+6h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhAdGH7Z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAB1606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAAB1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kprek+6h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhAdGH7Z
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ut7b3371421
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f4vJSRhDZHy
	S73+zYMlmwHlpixBWEVvFN4R+HULRvrM=; b=Kprek+6hLPDKh/Yv5xVeukXACjM
	YelmrVmWTf/xCcxwU3o/WWgb5kQpKXZbBJ9Z7B6NmIs5yqOlJUx73rxZF6T5nhlM
	byk/TgF4q2Zg023GiLy6Rwm1wak0f3oi77CwvaJNd05tTgm3X7MKUl3Nsr1FWn0c
	Hnz0I3+/staxixuosom8omtNwfjjk4V7azGnUnaP4zvFMw9XQx/aK+aMOsSS5Wm+
	/KjvlDpCTqB65lGU+ZzgzHlktfqbFq2fk7nBaKmrKhujQIUNGjZ9RqZjhyvjW4hJ
	sWwRprcZXJ1mpVfKczx65BdkBDA4Fpn5604z0qlRif+/GkhpO8288k7EX7g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sk66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so527532eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983807; x=1795588607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4vJSRhDZHyS73+zYMlmwHlpixBWEVvFN4R+HULRvrM=;
        b=LhAdGH7ZKAaZkmw6ZilQy6jCw8ULbLfx4+XseK/2tSBkPJOo0fsi5sBEVvmQ6dT4aT
         M8fXFg8qYKFGs/8xLoZx9cpNrqTv92NbroRUkxj3N0D6zkn4DynqpBul0Io24QU8nGpB
         8i48r+jj6VUOL6fdzab77VcQe+gcf1THFX2jG4F/jqA+px/WQnL/zUaK6aKOFfsjDX79
         MScuA0miFmTjxN8mqICF40pEi0OOLW8SkUzUNWNir06zJ7ZjQZn5VR0M+RhpQi8tNdR9
         mvR3nxhi37NyPiqLEI/wuY/IPNv/10UIuvlEiKfyijP90kbT50PBdZxa9oz9AiW0E5LX
         1IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983807; x=1795588607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4vJSRhDZHyS73+zYMlmwHlpixBWEVvFN4R+HULRvrM=;
        b=1VMSQxpiMCuJ/qiJgY5rm7NqaYaEJmsFnG+RmRUZyrEjWP19Neqjea1TYSVQlWRfmM
         vJifwgc8lPj+vcqnYqIDzSCLIHdJKM93Pl5c3qTRTQ/rXULUm8ELuX0RWKIjypKz1aS+
         IoftEEbZ9GH89hl1eWQbUhHTj/c2nVirqA7vvuGaz2lJllaikuQJyDOa5myf/X1utLT5
         UK9915iT9kV5iFs/7eUG8KZnQHPElzJcsgsU0nq/djAov6HGijZHRrK3Ia8MtDB/kLR2
         qPOMjECffXTboPCyB/+aGHXyePsHcN7isJq2hqttVQRYoG6oMMOPGGbefJ2XCjcYCgj2
         1BeA==
X-Gm-Message-State: APuU4Z+0lbDOQtwEQJtSoaA6cZXwCnB7UTm7oZy2sGYucmMdYlseYJ9q
	C/Q+7NQZ1E3tm2ckMQYzGeTTbzFUDvLp5j4d7U+yPXBr+khsmLXwULn+GRT+auvR7ASBrsu8aDS
	eCws+cQEHjkbJcIMtJnxDx4a1dxYwTcUrRIUK6x1bQ8qXB6/6R8vhp7RaLdz7CJMGQk5Szg==
X-Gm-Gg: AYBFou0i6CSjJ4Zucod68/wne37A5HFPb9roElN9Jt3djvRxrVS0IntBH5kLbRRN+fE
	5nM15HJ6qlzzsMxyVM1zhwJb7O3GpmOhbdAXm0b/Idj0EKV/ifZ4sU9W1unBJSnsqDVieKMp8yi
	zdXO2i+EDqJaZzVFXzcKe+Ec070i0ZjTrxyAdz8cqzGFsi2lELoa3St382Z5775cYBVkMy0auIq
	eedniRtmhzx6JA9i0rQyvZuCo/dB9n3Ry7HLTCRnJIWRoRVXvbEY8IEWHh7pTy8kNBwqVKOyZrw
	tDqVJYpDJhN2zHUrPclnxLkdPNPfCn9CTzkHTbB038O3/PHnHblxu6IOQjDuLoKTpiV9d7kjN65
	TtSaCgueP8qSrLjnXg0fDr7gjdnneEFba60Bhz2/gPdVArGI2WjIS4iymbA+hUrQ4LFgqOzrqqE
	c4SNwq6G1Cyg==
X-Received: by 2002:a05:7300:4720:b0:375:85ac:d14f with SMTP id 5a478bee46e88-3810eb0a0bfmr4096405eec.14.1794983807139;
        Tue, 17 Nov 2026 22:36:47 -0800 (PST)
X-Received: by 2002:a05:7300:4720:b0:375:85ac:d14f with SMTP id 5a478bee46e88-3810eb0a0bfmr4096384eec.14.1794983806343;
        Tue, 17 Nov 2026 22:36:46 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:46 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 13/19] wifi: nl80211/cfg80211: add support for NDP request indication
Date: Wed, 18 Nov 2026 12:05:48 +0530
Message-Id: <20261118063554.2260397-14-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd477f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SSWjfi26J-CRZlj5VBwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: VnUJvgFfS9FS_9iFGBNGTAH7snMihvZX
X-Proofpoint-ORIG-GUID: VnUJvgFfS9FS_9iFGBNGTAH7snMihvZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXwd8R1L4+bAwY
 dY14TB4mMynqtJ68hiXcPcvsjI4vnhi7nj32nIX7rQEsXkvlIRx57CXI8rjz6GBe8USfPRBxyTF
 /UkpJELJg1+edzj7ObDbUnFU9UH3hnqEdXxIPYH/oJ2i4WqNFmTT58Mzx0atmZFfJks+tCWcz6Y
 MyA2wQpj88GmKh/R1URyRN/ZyfLl1KjUZn0uJOn9IKDN9T+yF3i78gBlLbFJBYDoGhaSfRfCVai
 uo4yoJY4UVWSjhmlgbroCkqQ1DMApgYb1hCAV/50WFEqycatWakBxQqAH5KbhwHXmIVpxgWkiuS
 7YCFjqge4j1ENNkC8Me40HD5Xb2A9EYPLTqtK+skb1lHEp4It0ho3AkSdnkJ3U3brjVr0IoKPxE
 dT+IOyZc0C3gcHjSpKR223VC9AV98uRMymBH64utEUsn3vk8JrR5oOKWk0m90fWKGXUGkULJuAL
 R4aEFYDCh8twnV8a+ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXz1la0zgq8oQA
 iB9QwB2yaicnsMXXA+12v9t5wqJyKqGTuWCNb+E8xjeSqarL6PHjgjpxGGC9KuzFgxMDeWSMHfR
 TejzgDwj1QOsI3PqX99+4vndP9y8eEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180026

Use NL80211_CMD_NAN_NDP_INITIATE to notify userspace when the device
receives an NDP Request from a peer. Provide the received request
parameters through cfg80211_nan_ndp_request() so userspace can choose
the responder NDI and accept or reject the request.

Carry transport port and protocol values received from the peer in the
request indication, so userspace can learn how to reach the peer
service. Validate the notification parameters, trace them without PMKID
bytes, and deliver the event to the NAN owner or multicast group.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 55 ++++++++++++++++++++
 include/uapi/linux/nl80211.h |  9 +++-
 net/wireless/nl80211.c       | 99 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         | 83 ++++++++++++++++++++++++++++++
 4 files changed, 245 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index eda9a073422b..caff65d0c801 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4510,6 +4510,46 @@ struct cfg80211_nan_ndp_terminate {
 	u8 reason;
 };
 
+/**
+ * struct cfg80211_nan_ndp_request_params - NAN NDP request event parameters
+ *
+ * Sent to userspace when the driver receives a NDP Request frame.
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID from the received frame
+ * @init_ndi: initiator NDI MAC from the received frame
+ * @publish_id: publisher's service instance ID
+ * @ssi: service-specific info (may be NULL)
+ * @ssi_len: length of @ssi
+ * @cipher_suite: initiator's cipher suite ID
+ * @pmkid: PMKID from the peer's SCIA attribute (16 bytes), or NULL if absent
+ * @gtk_required: if true, initiator requires GTK protection
+ * @gtk_cipher: GTK cipher suite ID, included when @gtk_required is true
+ * @ipv6_intf_id: initiator's IPv6 link-local interface identifier, or NULL
+ *	if absent
+ * @transport_info: if true, the request contained transport information
+ * @transport_port: transport port received from the peer when
+ *	@transport_info is true
+ * @transport_protocol: IANA protocol number received from the peer when
+ *	@transport_info is true
+ */
+struct cfg80211_nan_ndp_request_params {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	u8 publish_id;
+	const u8 *ssi;
+	u8 ssi_len;
+	u32 cipher_suite;
+	const u8 *pmkid;
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
@@ -11674,6 +11714,21 @@ cfg80211_s1g_get_primary_sibling(struct wiphy *wiphy,
 }
 
 
+/**
+ * cfg80211_nan_ndp_request - notify userspace of a received NDP request
+ * @wdev: the wireless device reporting the event
+ * @params: NDP request parameters parsed from the received frame
+ * @gfp: allocation flags
+ *
+ * Notify userspace that a NAN Data Path request was received from a peer.
+ * This starts a responder-side setup attempt; the driver reports its final
+ * result once, including on rejection, failure, or timeout. Only valid when
+ * %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set.
+ */
+void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
+			      const struct cfg80211_nan_ndp_request_params *params,
+			      gfp_t gfp);
+
 /**
  * cfg80211_incumbent_signal_notify - Notify userspace of incumbent signal detection
  * @wiphy: the wiphy to use
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 54249b98fcc7..5c2dbe4f1463 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1593,6 +1593,12 @@
  *	Aware reason QoS_UNACCEPTABLE.
  *	Each accepted setup attempt completes asynchronously with exactly one
  *	%NL80211_CMD_NAN_NDP_STATUS notification, including on failure or timeout.
+ *	This command is also used as a notification when an NDP Request is
+ *	received from a peer. The notification carries %NL80211_ATTR_MAC and
+ *	%NL80211_ATTR_NAN_NDP with the received parameters. Userspace must ensure
+ *	the responder NDI exists before sending @NL80211_CMD_NAN_NDP_RESPOND.
+ *	Each indicated request is a setup attempt and completes with exactly one
+ *	%NL80211_CMD_NAN_NDP_STATUS notification, including on failure or timeout.
  * @NL80211_CMD_NAN_NDP_RESPOND: Respond to a received NDP request as
  *	the responder. Requires %NL80211_NAN_CAPA_OFFLOAD_NDP. The NDI
  *	interface specified in %NL80211_NAN_NDP_ATTR_RESP_NDI must already
@@ -8212,7 +8218,8 @@ enum nl80211_nan_conf_attributes {
  *	%NL80211_CMD_NAN_NDP_INITIATE and in an accepting
  *	%NL80211_CMD_NAN_NDP_RESPOND. The driver carries these values in the NDPE
  *	Service Info TLV (Generic Service Protocol). If the peer does not support
- *	NDPE, these values are not conveyed.
+ *	NDPE, these values are not conveyed. Peer-request notifications include
+ *	the pair when it was included by the peer.
  * @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL: u8 IANA protocol number. Must be
  *	supplied with @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT.
  * @NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS: optional u8 Minimum Time Slots field
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 571432435bfa..c9b7a5b4600a 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18982,6 +18982,105 @@ static int nl80211_nan_ndp_terminate(struct sk_buff *skb,
 	return rdev_nan_ndp_terminate(rdev, wdev, &params);
 }
 
+static void nl80211_send_nan_ndp_event(struct wireless_dev *wdev,
+				       struct sk_buff *msg, gfp_t gfp)
+{
+	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wdev->wiphy);
+
+	if (wdev->owner_nlportid)
+		genlmsg_unicast(wiphy_net(&rdev->wiphy), msg,
+				wdev->owner_nlportid);
+	else
+		genlmsg_multicast_netns(&nl80211_fam, wiphy_net(&rdev->wiphy),
+					msg, 0, NL80211_MCGRP_NAN, gfp);
+}
+
+void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
+			      const struct cfg80211_nan_ndp_request_params *params,
+			      gfp_t gfp)
+{
+	struct wiphy *wiphy = wdev->wiphy;
+	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
+	struct nlattr *ndp_attr;
+	struct sk_buff *msg;
+	void *hdr;
+
+	if (WARN_ON_ONCE(!params->peer_nmi || !params->init_ndi ||
+			 !params->ndp_id || wdev->iftype != NL80211_IFTYPE_NAN ||
+			 !(wiphy->nan_capa.flags &
+			   WIPHY_NAN_FLAGS_OFFLOAD_NDP)))
+		return;
+
+	trace_cfg80211_nan_ndp_request(wiphy, wdev, params);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, gfp);
+	if (!msg)
+		return;
+
+	hdr = nl80211hdr_put(msg, 0, 0, 0, NL80211_CMD_NAN_NDP_INITIATE);
+	if (!hdr)
+		goto nla_put_failure;
+
+	if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
+	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
+			      NL80211_ATTR_PAD) ||
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, params->peer_nmi))
+		goto nla_put_failure;
+
+	ndp_attr = nla_nest_start_noflag(msg, NL80211_ATTR_NAN_NDP);
+	if (!ndp_attr)
+		goto nla_put_failure;
+
+	if (nla_put_u8(msg, NL80211_NAN_NDP_ATTR_ID, params->ndp_id) ||
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_INIT_NDI, ETH_ALEN,
+		    params->init_ndi) ||
+	    nla_put_u8(msg, NL80211_NAN_NDP_ATTR_PUBLISH_ID,
+		       params->publish_id))
+		goto nla_put_failure;
+
+	if (params->ssi && params->ssi_len &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_SSI, params->ssi_len,
+		    params->ssi))
+		goto nla_put_failure;
+
+	if (params->cipher_suite &&
+	    nla_put_u32(msg, NL80211_NAN_NDP_ATTR_CIPHER_SUITE,
+			params->cipher_suite))
+		goto nla_put_failure;
+
+	if (params->pmkid &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_PMKID, WLAN_PMKID_LEN,
+		    params->pmkid))
+		goto nla_put_failure;
+
+	if (params->gtk_required &&
+	    (nla_put_flag(msg, NL80211_NAN_NDP_ATTR_GTK_REQUIRED) ||
+	     nla_put_u32(msg, NL80211_NAN_NDP_ATTR_GTK_CIPHER,
+			 params->gtk_cipher)))
+		goto nla_put_failure;
+
+	if (params->ipv6_intf_id &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_IPV6_INTF_ID,
+		    NL80211_NAN_NDP_IPV6_INTF_ID_LEN, params->ipv6_intf_id))
+		goto nla_put_failure;
+
+	if (params->transport_info &&
+	    (nla_put_u16(msg, NL80211_NAN_NDP_ATTR_TRANSPORT_PORT,
+			 params->transport_port) ||
+	     nla_put_u8(msg, NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL,
+			params->transport_protocol)))
+		goto nla_put_failure;
+
+	nla_nest_end(msg, ndp_attr);
+	genlmsg_end(msg, hdr);
+	nl80211_send_nan_ndp_event(wdev, msg, gfp);
+	return;
+
+nla_put_failure:
+	nlmsg_free(msg);
+}
+EXPORT_SYMBOL(cfg80211_nan_ndp_request);
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index a843b52cbcfc..be7b3162c821 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4690,6 +4690,89 @@ TRACE_EVENT(cfg80211_nan_cluster_joined,
 		  __entry->new_cluster ? " [new]" : "")
 );
 
+#define CFG80211_NDP_REQUEST_FMT_1 \
+	", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, "
+#define CFG80211_NDP_REQUEST_FMT_2 \
+	"publish_id: %u, ssi_len: %u, ssi: %s, "
+#define CFG80211_NDP_REQUEST_FMT_3 \
+	"cipher_suite: %u, pmkid_present: %d, "
+#define CFG80211_NDP_REQUEST_FMT_4 \
+	"gtk_required: %d, gtk_cipher: %u, "
+#define CFG80211_NDP_REQUEST_FMT_5 \
+	"ipv6_intf_id_present: %d, ipv6_intf_id: %s"
+
+TRACE_EVENT(cfg80211_nan_ndp_request,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 const struct cfg80211_nan_ndp_request_params *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__field(u8, publish_id)
+		__field(u8, ssi_len)
+		__dynamic_array(u8, ssi, params->ssi_len)
+		__field(u32, cipher_suite)
+		__field(bool, pmkid_present)
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
+		__entry->publish_id = params->publish_id;
+		__entry->ssi_len = params->ssi_len;
+		if (params->ssi && params->ssi_len)
+			memcpy(__get_dynamic_array(ssi), params->ssi,
+			       params->ssi_len);
+		__entry->cipher_suite = params->cipher_suite;
+		__entry->pmkid_present = !!params->pmkid;
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
+		  CFG80211_NDP_REQUEST_FMT_1 CFG80211_NDP_REQUEST_FMT_2
+		  CFG80211_NDP_REQUEST_FMT_3 CFG80211_NDP_REQUEST_FMT_4
+		  CFG80211_NDP_REQUEST_FMT_5
+		  ", transport_info: %d, transport_port: %u, transport_protocol: %u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->peer_nmi, __entry->ndp_id,
+		  __entry->init_ndi, __entry->publish_id, __entry->ssi_len,
+		  __print_array(__get_dynamic_array(ssi), __entry->ssi_len,
+				sizeof(u8)),
+		  __entry->cipher_suite, __entry->pmkid_present,
+		  __entry->gtk_required, __entry->gtk_cipher,
+		  __entry->ipv6_intf_id_present,
+		  __print_array(__entry->ipv6_intf_id,
+				NL80211_NAN_NDP_IPV6_INTF_ID_LEN, sizeof(u8)),
+		  __entry->transport_info, __entry->transport_port,
+		  __entry->transport_protocol)
+);
+#undef CFG80211_NDP_REQUEST_FMT_1
+#undef CFG80211_NDP_REQUEST_FMT_2
+#undef CFG80211_NDP_REQUEST_FMT_3
+#undef CFG80211_NDP_REQUEST_FMT_4
+#undef CFG80211_NDP_REQUEST_FMT_5
+
 TRACE_EVENT(cfg80211_incumbent_signal_notify,
 	TP_PROTO(struct wiphy *wiphy,
 		 const struct cfg80211_chan_def *chandef,
-- 
2.34.1

