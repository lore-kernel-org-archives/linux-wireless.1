Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565401;
	b=K58xlftp6vz1YyxTw43mLP+RDFngDQjUw9O2RHavJIm5DRoo/a7GQ+m05YTyMFffFibD
	 7I8G5K9Ceue9wM7d+5MGfIt4buIjjj+K5PSQ03PNuDGj8VjThmN4suXFfN11BR44Xz/+z
	 KwSNuu9ifN5sEtWfI+kVeS4gwU5eN8siBlXQs4JkaHGDRFvws6WCZN54GwkVBoZ8j/ZC1
	 T+P7R8rgECDN6N2s39KFXuACR6iJBx5pDqXmzG/VuJJLnfTNNg7KigP6Limz2LeWVflb8
	 qJN8Uiig2j18oOZvXz+T47lnEQZDG9oKm1cn6v8ahzSuDWYWL1XqmLCetJRFWJwRBtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y5pV2LYHT/80+6quSji2QvUXkIvcLiFt7ynj4a98a8Q=;
	b=cg3VDcmJHlx3eafLQ+W7p2INxRcs371Uxbt9HcF/ePjSCrhwC3tME4kkX+I88UK/cCa1
	 hIwzl5K85ODfg/JC4zckh48AVXqrBRz0mY+zzVCjWJuoWUza14R8WMNssXkXK6zUDrNGe
	 6EiQbATwcgSKNJl711VKixg8EQNpshaAGUbBmHqBSsBubnHESkcbaj5cxJ28ta5LgbLto
	 cXItX1haso0acdAlUVzaYerJr5AsLEJP/q/6z+y8/QzmVlkQMUsXMI5gfzIEfm4lyJc9F
	 Dk2kPSUqVZ0kvK6ZAaMJkGe3/BMvv8QY2Z4bDJ6/8hGCO7BxtO0CcOYt7GQwetRw5Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z42Y8DA5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ePJcHwN6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7155460A2607
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7155460A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z42Y8DA5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ePJcHwN6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADA5B9O1163318
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y5pV2LYHT/8
	0+6quSji2QvUXkIvcLiFt7ynj4a98a8Q=; b=Z42Y8DA5aBnWTK2N3m4x5puU8sw
	4XFezdzlUGKcXe5ZGvhdoiAqVwOaPQl8268eCFtdnDEnAOkHblx8SYaLFe6Xs5+f
	XJJsPhKwIx23X/dqwRKOmWbCdPszaqz57RjtRIArZOji83CjcSQ2YOq0JIEz+Wbv
	8PTiObLr23B6ZsZ9J3xi6S3Sarw6Fp5Ga50c1tH+rT+EPdhwx2XRZQY5GMZDcCMp
	PyEE7wQijsg/uTh2qGl0NdcdT8Igu0yCXhHVQYOXh97nEfo1O/BBEoLGjvUHNGzu
	48fg9Fa1KIOqcC98FhHILyhzKp2pp6UQA+CZIOQQ8t+87GOnYHnfZrUV81A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g201w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso3744562eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565400; x=1795170200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5pV2LYHT/80+6quSji2QvUXkIvcLiFt7ynj4a98a8Q=;
        b=ePJcHwN6ZVh39D3BuWe6cq5Rskhw30so3X5ODlzJ2RYtQyTurqjG38QFpYq+9fuszT
         3plWYck42gV2PUG6gQoZVX4dsgfQRf8ZEKFNSYfJUVgMJFP+94O3HIkWY+OVCsw/DoN5
         Zma9qvYYEakfhcWwBkWDR2m/pMO5hvRf87LZUcSI1mbj+vlh72c8QSKbJq6TUmJGgkIp
         eoKrt7g64+LLB0gM20PMZC8U+L8Lqs2dpQz2bBQ/ffYY5D/duJIai/jzRWfs5QXQEZQy
         Wrdjz7GfpZo2st8uYt5su2FhbwVZewrrZ6y5aoc5/BFCG63+l+dUABz0otRMulxqcFc4
         UKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565400; x=1795170200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5pV2LYHT/80+6quSji2QvUXkIvcLiFt7ynj4a98a8Q=;
        b=fMkAG+2ZdMLqJy/HOa8Cv91cdy2f3NUtnjtwInJMdqXWAT9pGmsr4157QreqyOiMt2
         FoNTEtE8D7A3p4loaF2u/44drqkGCVmlUa35BuELRmkDOBHjpIQgp3+TT1LiIQjflZT6
         UI1Eg54MCsAL8+WraLha2YLExglYexaNe629eJziXHLYiMCL2MqBKa31ypOAaKp/GDte
         PMdjWI/huJWdMawVbbAmM5ev69K6MJ4bUQaBylgxKDKOD4JLDMcY5//elpCJWJCIQelh
         L0/bsQbsW9HmydU+QidLRyLU86hHfKJXtDCTgr8jbRCRJNqzqjrlU1KqJ9a9WYCt9Arw
         dB+w==
X-Gm-Message-State: APuU4Z+s8KcF0YfVg0W0e8BvJ8nmLxow74k0yMhSpc0vqcsjfIwOSa1l
	SLoYqCnr1Osu5exXShr4DzPeOlH7EifiC6YDHDs8K85ML+6T2O/gQ2ulPh4pPe/QnWDVQkHoKjF
	BdC1V1Mvow9BAbL/oTr5QxM4x/ifJuNXvAErCHyqy23/SQKjgfdo69VRLnGjMVElobm7EIA==
X-Gm-Gg: AYBFou3AQFdZkaF5ZUlDraeULQUtfoMvAvy1dcyq+jEkJImpd2HA5YQh5cBLhbrVAdv
	gh2cuyPUU1jOee5zkMmO/dZUVd/pVfRhGRye5jeeMUtSFK+yn9BwBDSG7jZTCTd6S6aqg6uxS4h
	5w2w64qaBSW/qeou6WF34Tw4CycPohtnNlGNIyuM4pB7bv2YNkCIFllQ835LvzNo8ld9bRfRAhL
	MNc/8sJ54QKP2FS3T2hF9yTsvNYsO24+smuDg/H8iSjzl90AnDrJXZ4T+wmGcLw4rqYKfv6hjZp
	Ty287GfLN3gPw0pq9uyR1SyYncitQtS8sTytySOJ6vvgDWDhSXz5jwkWNJBlb6jFSE9V0UPSS3A
	OrUuffJRtUuoajAUoFffzKLrVfnt8I2DOP+pQyFfivGZnbzOkx19x69TM7ZBvBrph87yT9sQIPN
	sMo49aWs9NUCQ=
X-Received: by 2002:a05:693c:8212:b0:36f:550f:bb0d with SMTP id 5a478bee46e88-37963953f17mr2006436eec.5.1794565399804;
        Fri, 13 Nov 2026 02:23:19 -0800 (PST)
X-Received: by 2002:a05:693c:8212:b0:36f:550f:bb0d with SMTP id 5a478bee46e88-37963953f17mr2006407eec.5.1794565399144;
        Fri, 13 Nov 2026 02:23:19 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:18 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 12/19] wifi: nl80211/cfg80211: add support for NDP termination in offload mode
Date: Fri, 13 Nov 2026 15:52:21 +0530
Message-Id: <20261113102228.1917973-13-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX+nabOsc5h8Dn
 PEuZ53ocmmVM04yQv4zr97XxdcnipK/2PISjC8lqEgjurGAbdPVR1tixhUEkDtdOIz02VUWAuZF
 e2DBwNSDEHekuSv8z8a51ZjS5GmTkz9InMiG2Hpq09fvQNWnIWpf6vc4wNxpBJSolXDO4LHrti/
 BYYHiJBMhxSswJhVlF/Ji/pvhnsmWWkKsyt4HDyOee8FmrOmYfHMkwspFs260oTCx6vhW8h8juF
 DMNFOeT7MzT57J8QUsQbzA8reESycfD9yCBzGI7wY93r5JjXpXG7Cg3QbYOBWdcewG26uPy7+qb
 rEfS3jDMp6mlA6cJ91IFtYbx9/pv5FDOXxYsoXCiw8o9XM7sSjm1szR3Namz/D5bMxgLNHbkgo6
 DGxY98yNZJRyxOLvd+l0qGxMtQ/8QnZGNf0z4jQJJDNp8YITTWPTg1JPwj51PTHAiemTQ0S+Rvp
 5YH3YHFEyksvgyBr3XQ==
X-Proofpoint-ORIG-GUID: ugoddrNLeymXThyLtvxWU2aX5XNCvVpF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX8kcniZXEmmG1
 6KEIjoJmLDD0HyhEY6x2pg6C95l7HmI/DTZPdWp/T80FpNaCu9Ib/jP5E36ocwdOZv8c7OiXTEo
 pR95X5xEAiihaEdN6ESI9w2MH+bdGrU=
X-Proofpoint-GUID: ugoddrNLeymXThyLtvxWU2aX5XNCvVpF
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af6e518 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lOWCkuXlYGhT4362-qIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130041

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

