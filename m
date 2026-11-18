Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983807;
	b=i4a+HG0yiGPyTmFzSZGFBA3luuPBZaq+/v+pqGwfG0Vmi91/3Ox6SZsK6o3rZid4pZav
	 e20J5G2XOubZwl/7sPrp63g5Vvy0IK6qgOQQ7cSqvV7w/dKWN5jb+ur+GX0+YupJJ5kHH
	 E9k6WNZovjcrimQoyGnYpAw1i8PxBgfiFYQotZ4EMSWIAY7av8pn4ku3pEcF19uL19mDR
	 RRUMRF4aPNYTnjnkI3i2X3rhP31Tb/BhI4SR/L1NNdw0+/ZHJ9X0nIBPxGYP+CsTK8FMV
	 4rwdYI5RIxBnhe2XWFNtUSV8icWSwn01tAtprtdLOhDn0WxR/kFdAYa53jqX+md2rnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y5pV2LYHT/80+6quSji2QvUXkIvcLiFt7ynj4a98a8Q=;
	b=qY9ciCL46N2/akhsAfC0PImOyunA08mUARbSpcHqsH8CFTFXhEYIpS507HnFQHhQaDLQ
	 +nvm08htOUU5q1y9/LTTllvI7Uki7aj39anjF/BF7af8cuy28sO2YT06NRq2h9TTWAOK0
	 eawLzZ3jO+BvmxOo/kveHRw9RP6PknAIFE/pOIB+c0K4IYuUaTMOxuKYczYtEUrvcTt+0
	 RcyPFWIczwcbW6IbEvre8euN/TtwRwjn89BWknKN2QZSUCE10UuNLiB63/iQh8T57ASEa
	 jPlfggvGtb3l+bxRrr8N+11Nk+VQeUiELezKssNhE6trUmTKN6zFcSB4nMZj5T9yaQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1vtgnHq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvCDhDko;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E232606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E232606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1vtgnHq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvCDhDko
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwEG472554
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y5pV2LYHT/8
	0+6quSji2QvUXkIvcLiFt7ynj4a98a8Q=; b=i1vtgnHq454iX81+3PBJBsaIB3+
	04w6iTXrGVAs9aeRAHDrBXp23nJQqAzyGlGKTzzbAIgFHt3VqAHbZAqyHgrawVjA
	McGFrgygZJ7OuywM5tmSjwo/Sp3R7QmOZ9JOa1wYtHWdqRhflNnEUCRD/+L3wia5
	pV7NktVUXVQCOkJPO412A4VtIcgi2dEgNj9roNlttoc5Vxi11n/rSFypK6oe2yUo
	HJCPFviyLdS/niJ5U8n1o3AhDKFa9ltAsOW98Bxxp/yyC4Kg+Z3jDyrH3BX8/uiA
	Vwmkv03CqbgaNgMjfj/nGvOPLjn+rXku/MSYszKadY/dAQ3YB+3S+O0VTTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89jqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so445496eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983805; x=1795588605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5pV2LYHT/80+6quSji2QvUXkIvcLiFt7ynj4a98a8Q=;
        b=YvCDhDko0j2O9csDmx8Pa3P13f1pwAwZkgrYYpf027PPLZKAT4BFjAzmN8jK17nLhD
         932j1bTs2vG40yKBmxkXmhx4nLck6QAtLYvXVMVgYcchxeUS052T75cNFDJbMi0Ts9dx
         ZWl/3pYoQuzwcU79WQ79YxkVQEWwrRar0RvnXydIKSJblOQXawYXkvO1ezzr5vOm8dgg
         cJF1k9iF+L65UjuO0NhEr1wFgsGHjG/Afc+qChzcvkDSwiLgWqfxwMJ9yAeDBR0J19X2
         ahEfSfk2xT63DxW3JvyK7180740sEUl76IYd25rJT8l4ne5wgDCdECh8x5vdkCTRYEUK
         wOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983805; x=1795588605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5pV2LYHT/80+6quSji2QvUXkIvcLiFt7ynj4a98a8Q=;
        b=CoxA1oLCMoC647zxZcEAoqXWLpzaR1V0nECgJzfiI9pXupiYAKOnfhL7IWusV7CQ0k
         LYrHvsTC5AhxVwDrH+etbt34FntsgKTAlLWuMeLx9fSAxjdydSTo2bBGFKci2O6u83ON
         OT0vnaJgVmvCjMUCt4hlcAHr/DzW6QECKaeX1efPXKoz/y5eAs0Qmrh6+JDj4WldJffz
         iP5+5qw0QWPWSsM5rbDyynrCFwf4eu6aL9hH7tSsLgrum2q/Kb7uSQ19aPd7+lZkSPxW
         Ve7bo3F30MvCPWIu6R6bNPluT0O1UEEhLkwtwbSAmB0ZZeRy7g4asWkAaMVXunUBpOLO
         +GtQ==
X-Gm-Message-State: APuU4Z9t7q7FqV1Q7zV5RfXTY+nzTe8NKYdCA8UUCblIqqQKHMQZEJID
	nu+W/EpK7imgD0oBHeNGeERSqUwA6hW+cpK6uYUvjnzgujuDcpFD87p73YY32ZS7L00oPtDbboC
	bfZUBFSyALHNyfkifgJ40bFfKq/dpjy5T2jTMuslWbSq+HyoOvQiVzYHmCvvhdsuVIRXMcw==
X-Gm-Gg: AZFdTZfxHSU+j5X4B9N3jTj9Xjqj53Os0CkomDpk4/QZThiIKY/bIAS5/TL6bY4wCRC
	pPMV1CURh/XrUyOchve/hOFK1e0UhiNkUZduwKmxF1oY6SwpGZIeGj1UCGZ6w3W1i8O+SiHhh9+
	2ZYxQmB40G1KRdNxmTNwkWbQKGU3xLtxL4RSPRo/evwEk5JDe8ONK7xN5eLXirGoYu08uFec5WG
	qEc094TjecIVYhxqXPvBvKdER1+OYRVunWuCpjy3BaUwu/UtKZmV4x0CYK57iEFXwyjmfJztbrL
	Zqot7iTD+aFCAcQmkat0TOLCSk5t5tUQW9rx1cnQhXUAVExLsGvWiL/V+wqRH4YctwU568CZgNa
	8aXOk7JdX7wOxrFKc6GMM5ttSCin3W6UiWxu8IIjSdzwgk3j7/ovpbtZWmSLBtKJcArRJNtMyzp
	HMMcn5cUR3YA==
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr6812644eec.7.1794983804590;
        Tue, 17 Nov 2026 22:36:44 -0800 (PST)
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr6812599eec.7.1794983803741;
        Tue, 17 Nov 2026 22:36:43 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:43 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 12/19] wifi: nl80211/cfg80211: add support for NDP termination in offload mode
Date: Wed, 18 Nov 2026 12:05:47 +0530
Message-Id: <20261118063554.2260397-13-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: kzEzHrZhU-GsnYQbbzCe8EZUmz72bRrw
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd477e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lOWCkuXlYGhT4362-qIA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX76500EUNQ4gn
 C5CbkOE6isBQDwxT/OOPZPVdmE2b9a9eJRLekYqHHw/6CZUaUtPSiOmFaOcG75RPU/5RsRspHMc
 vOCu5sQTBO4AdXEWmIwRlFELEFFL2umPn0OKJERlKjBlJUF1N71j2a50g2FbZdRIn5/0rnaZ08z
 x3Gf5itZzVr1X85Wb9Cbnk1gJXykxdX7VIdh+/0Rv4d04qr0JTvYxGOpVGPAD5vXxVWq3wns7T0
 cTCwBWyZcJ12xqMBOyq0XwEWxloXNqvp0hOuZD3RqVr6XILJeET/uqUyFuOs8vFyfMMkrOBUPTc
 IU0U+Nln1Kmk0XS20OibouG23dK+AtUtUd+++2Qh5Uh/MaQYOPNZUj1rkwz2nmRpPoOU1ux6LLR
 di3uek5t9U85E2mGh9FIB6bB0RwuJ51ZBhiSSPE/tP3uwx52JPY0quOsW7h1URyHhq2Vs0C+ZSx
 ZPnQbWlc4sSqX8FbEiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXxkWOCq7wnPLB
 ns/CB+ifYcvC4EZ4hvVdg1GeFyuz/lKxw5tZxtQ64NZnJWFFFWLLA+CMmaWtL2xYZb+Uc686nrM
 ZQricqbWY5ufx9ci1or9uj2zSbVz+9k=
X-Proofpoint-GUID: kzEzHrZhU-GsnYQbbzCe8EZUmz72bRrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

Add NL80211_CMD_NAN_NDP_TERMINATE to let userspace tear down an NDP or
cancel NDP setup in progress when the device offloads NDP management.
Pass the initiator NDI from the request through to the driver; it may
identify either the local or peer NDI and is not validated as a local
interface.

Add the termination parameter structure, command handler, and driver
callback, and trace the initiator NDI with the other request metadata.

The initiate path builds its reply before calling the driver, but the
reply can still fail to reach userspace after the driver has accepted
the setup (for example, if the socket receive buffer is full). In that
case userspace never learns the NDP ID, so use the new callback to
cancel the setup.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 24 +++++++++++
 include/uapi/linux/nl80211.h |  7 ++++
 net/wireless/nl80211.c       | 79 +++++++++++++++++++++++++++++++++++-
 net/wireless/rdev-ops.h      | 16 ++++++++
 net/wireless/trace.h         | 27 ++++++++++++
 5 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 5857ce6be50f..eda9a073422b 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4495,6 +4495,21 @@ struct cfg80211_nan_ndp_respond {
 	u16 qos_max_latency;
 };
 
+/**
+ * struct cfg80211_nan_ndp_terminate - NAN NDP terminate parameters
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID to terminate
+ * @init_ndi: initiator NDI MAC address
+ * @reason: Wi-Fi Aware reason code for termination
+ */
+struct cfg80211_nan_ndp_terminate {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	u8 reason;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -5495,6 +5510,12 @@ struct mgmt_frame_regs {
  *	asynchronously after the handshake. If the accepted response's QoS
  *	requirements cannot be met, the driver reports setup failure with the
  *	Wi-Fi Aware reason QoS_UNACCEPTABLE.
+ * @nan_ndp_terminate: Terminate an NDP session or cancel NDP setup in
+ *	progress. cfg80211 also uses it to cancel a locally initiated setup
+ *	whose NDP ID reply could not be delivered to userspace. Only valid if
+ *	the driver has set %WIPHY_NAN_FLAGS_OFFLOAD_NDP. Returning success
+ *	acknowledges the request; report completion asynchronously with
+ *	cfg80211_nan_ndp_terminated().
  *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
@@ -5916,6 +5937,9 @@ struct cfg80211_ops {
 	int	(*nan_ndp_respond)(struct wiphy *wiphy,
 				   struct wireless_dev *wdev,
 				   struct cfg80211_nan_ndp_respond *params);
+	int	(*nan_ndp_terminate)(struct wiphy *wiphy,
+				     struct wireless_dev *wdev,
+				     struct cfg80211_nan_ndp_terminate *params);
 	int	(*set_multicast_to_unicast)(struct wiphy *wiphy,
 					    struct net_device *dev,
 					    const bool enabled);
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 1d5e2f2f08ca..54249b98fcc7 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1605,6 +1605,12 @@
  *	NDL QoS attributes may also be supplied only when accepting. If the device
  *	cannot meet the QoS requirements in an accepted response, setup fails and
  *	the status notification reports the Wi-Fi Aware reason QoS_UNACCEPTABLE.
+ * @NL80211_CMD_NAN_NDP_TERMINATE: Terminate an NDP or cancel setup in progress.
+ *	Requires %NL80211_NAN_CAPA_OFFLOAD_NDP. Carries %NL80211_ATTR_NAN_NDP
+ *	nested with %NL80211_NAN_NDP_ATTR_ID, %NL80211_NAN_NDP_ATTR_INIT_NDI
+ *	and optionally %NL80211_NAN_NDP_ATTR_REASON.
+ *	The command reply acknowledges the request; teardown completion is
+ *	reported asynchronously by the termination notification.
  *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
@@ -1895,6 +1901,7 @@ enum nl80211_commands {
 
 	NL80211_CMD_NAN_NDP_INITIATE,
 	NL80211_CMD_NAN_NDP_RESPOND,
+	NL80211_CMD_NAN_NDP_TERMINATE,
 
 	/* add new commands above here */
 
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 74be0f639315..571432435bfa 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18738,7 +18738,26 @@ static int nl80211_nan_ndp_initiate(struct sk_buff *skb,
 	*(u8 *)nla_data(id_attr) = params.ndp_id;
 	nla_nest_end(msg, ndp_attr);
 	genlmsg_end(msg, hdr);
-	return genlmsg_reply(msg, info);
+	err = genlmsg_reply(msg, info);
+	if (err) {
+		struct cfg80211_nan_ndp_terminate terminate = {
+			.peer_nmi = params.peer_nmi,
+			.ndp_id = params.ndp_id,
+			.init_ndi = params.init_ndi,
+		};
+		int term_err;
+
+		/* Userspace never learned the NDP ID, so it cannot manage
+		 * this NDP; cancel the setup the driver already accepted.
+		 */
+		term_err = rdev_nan_ndp_terminate(rdev, wdev, &terminate);
+		if (term_err)
+			wiphy_warn(&rdev->wiphy,
+				   "failed to terminate NDP %u after reply error: %d (%d)\n",
+				   params.ndp_id, err, term_err);
+	}
+
+	return err;
 }
 
 static int nl80211_nan_ndp_respond(struct sk_buff *skb,
@@ -18911,6 +18930,58 @@ static int nl80211_nan_ndp_respond(struct sk_buff *skb,
 	return rdev_nan_ndp_respond(rdev, wdev, &params);
 }
 
+static int nl80211_nan_ndp_terminate(struct sk_buff *skb,
+				     struct genl_info *info)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct wireless_dev *wdev = info->user_ptr[1];
+	struct nlattr *tb[NL80211_NAN_NDP_ATTR_MAX + 1];
+	struct cfg80211_nan_ndp_terminate params = {};
+	int err;
+
+	if (wdev->iftype != NL80211_IFTYPE_NAN) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP terminate requires NAN interface");
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
+			       "NDP terminate requires peer NMI and NDP params");
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
+	if (!tb[NL80211_NAN_NDP_ATTR_ID] ||
+	    !tb[NL80211_NAN_NDP_ATTR_INIT_NDI]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP terminate requires NDP ID and INIT_NDI");
+		return -EINVAL;
+	}
+
+	params.peer_nmi = nla_data(info->attrs[NL80211_ATTR_MAC]);
+	params.ndp_id = nla_get_u8(tb[NL80211_NAN_NDP_ATTR_ID]);
+	params.init_ndi = nla_data(tb[NL80211_NAN_NDP_ATTR_INIT_NDI]);
+
+	if (tb[NL80211_NAN_NDP_ATTR_REASON])
+		params.reason = nla_get_u8(tb[NL80211_NAN_NDP_ATTR_REASON]);
+
+	return rdev_nan_ndp_terminate(rdev, wdev, &params);
+}
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
@@ -22237,6 +22308,12 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
 					 NL80211_FLAG_CLEAR_SKB),
 	},
+	{
+		.cmd = NL80211_CMD_NAN_NDP_TERMINATE,
+		.doit = nl80211_nan_ndp_terminate,
+		.flags = GENL_ADMIN_PERM,
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP),
+	},
 };
 
 static struct genl_family nl80211_fam __ro_after_init = {
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index c58b83210d60..3e4e0d768ae5 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1221,6 +1221,22 @@ rdev_nan_ndp_respond(struct cfg80211_registered_device *rdev,
 	return ret;
 }
 
+static inline int
+rdev_nan_ndp_terminate(struct cfg80211_registered_device *rdev,
+		       struct wireless_dev *wdev,
+		       struct cfg80211_nan_ndp_terminate *params)
+{
+	int ret;
+
+	if (!rdev->ops->nan_ndp_terminate)
+		return -EOPNOTSUPP;
+
+	trace_rdev_nan_ndp_terminate(&rdev->wiphy, wdev, params);
+	ret = rdev->ops->nan_ndp_terminate(&rdev->wiphy, wdev, params);
+	trace_rdev_return_int(&rdev->wiphy, ret);
+	return ret;
+}
+
 static inline int rdev_set_mac_acl(struct cfg80211_registered_device *rdev,
 				   struct net_device *dev,
 				   struct cfg80211_acl_data *params)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 8c5fdbe23747..a843b52cbcfc 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2737,6 +2737,33 @@ TRACE_EVENT(rdev_nan_ndp_respond,
 #undef NDP_RESP_FMT_3
 #undef NDP_RESP_FMT_4
 
+TRACE_EVENT(rdev_nan_ndp_terminate,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 struct cfg80211_nan_ndp_terminate *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__field(u8, reason)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		memcpy(__entry->peer_nmi, params->peer_nmi, ETH_ALEN);
+		__entry->ndp_id = params->ndp_id;
+		memcpy(__entry->init_ndi, params->init_ndi, ETH_ALEN);
+		__entry->reason = params->reason;
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  ", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, reason: %u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG,
+		  __entry->peer_nmi, __entry->ndp_id, __entry->init_ndi,
+		  __entry->reason)
+);
+
 TRACE_EVENT(rdev_set_mac_acl,
 	TP_PROTO(struct wiphy *wiphy, struct net_device *netdev,
 		 struct cfg80211_acl_data *params),
-- 
2.34.1

