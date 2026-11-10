Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285189;
	b=p8QNge1GfCPRy8w5nTV5wKEsgksBlZwzouOhB7Zp09GFGLRmYTHlDsaBKg5ntVHmjBfA
	 sm31mlexkKdG3+qXQujU8vMYsUlwHlHEghkPykff0zabvvPL7gBAC6KTm1s6DCZjl+j95
	 cYCnoXtwRANglg2Ezo3STRBL3uGLJ2bt+Vd4QGqVGcH1rUiRz3O9nMjjs4WaqItXxCG/e
	 Y+vV94fVR2dyA6k1MfBBvjQtfw6z+H+oLYdN4wRSUODy+2GFwCOLijp4Cx+bue+/LLilO
	 dAkAhHPLM3V3pA9DGtHW5beNeH3DjmZY1YpHqtt7NFArPgiY1vR5K6Z0VBx0BhpGz4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UPX3LYJsFMR3Eapmnh5i7eAxWW9Ps6SnvakFmfCrbWU=;
	b=SvK9UOyysgQnQoG9jG7X74f/wnEB/KvhU0lAsz1NhpCkLIQMwbW7fpol8pEhGjBcW7e4
	 AeM77vGgOhBrsXyfZO3A5fR+/tFpPg3M2QcEpD2QRDOEHBezE60WsBM2y2cVk7Vjdj2+z
	 sA6eXgdVFp7OzAqT53SfMkmDDr1d5P7fvGImRP9Hm4Jb6HQWShIaT0vM7qt78B16BVW6C
	 UOGJ9PwOjJ9LKNHutkFVZWXgV2eRwluoQ1XA/eJzD6ceeBRwEzYBWpdIT6R4kEjfVi/PY
	 v2vG5gEAaqpZ/VpgXG2mDl1nbs6ylc8w0IKgEqnlrrANov2A2VFCZSlCvdvd3A6uBnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AcW9x6qH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ncz0qMbM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25011606A88D
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25011606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AcW9x6qH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ncz0qMbM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ADgZ2928656
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UPX3LYJsFMR
	3Eapmnh5i7eAxWW9Ps6SnvakFmfCrbWU=; b=AcW9x6qHa5BSGrxAHRjGhkdM2cy
	ntEYEKBC/7j5IRD3Q6K2RSt0VRODi7Gkypi4gal1k2eGoRCdZgSGo0B/RmuV81b5
	DhrGgeDlgQzeuhub0zCLAS8eQu2nTHgAo4UxY6Y3AhMnOKjhNzKxtmQbZVmoV9Xd
	/RPK8R6F8AHROrArE7363MlR1TVwKA+2FSm/8aV1cct9ih0kLpD3phtXY6pd0rEM
	1o8uzI0BkJt8RBrFPeY93ICHRIJLNUqbqxZ0KyAwppk7bXIkM7ddtsnIUIepLsyb
	s6rPE+e+B/UMUguo9RGulfcdZEKBKKA8d7SgadAr1Cwy+qRXs2c/qZawKUw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx82x41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so3009332eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285187; x=1794889987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPX3LYJsFMR3Eapmnh5i7eAxWW9Ps6SnvakFmfCrbWU=;
        b=Ncz0qMbMFdUlpRByExrRGOZXYxw3nRerugMVip8gZQ0NuHkcRNIRRaIl9aNcObsSxZ
         ESsKQEkBHdcaQrKW7v8d1P5EIE2MspheXqG6B0zHYEmgDEmz58ABtrTNf/764aSZTowZ
         2li9jL5Z7nBRJ7kUmlZc9Tgoq7z99MfSUuWCpx2ZMJgQIZvRQFBcrIO0HPo8Hl7vbFnl
         X0DdW7A+UGRl4Xk402ovgu/faZv8QcUboHoDDcjMZSykCNASCTWR3ikiykCPufqTCTvP
         DizKyNJ80Vk+U3YZSol0nsFAXcVqNDCse7aD/TOz+hyMAOAWb9tgUka59QdNzqM+9yTF
         kCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285187; x=1794889987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPX3LYJsFMR3Eapmnh5i7eAxWW9Ps6SnvakFmfCrbWU=;
        b=TT3jozFl+0/UO5Axj9tTsDhIyLzdDPxgKvxVteqS/2j0MkCFN1pTXcH1MrDvHQebDU
         FXVnQmYO69BgZCPTcYk2vsNkYPc7wPyn5VS9P0ARQpxmnvEnUAQyzKNyb75hUA4T6oUo
         CDuRbyb+wkaKT5XjxJskhHuoo00XjqvpAz1Uj1ROh3yPY1+rDGVdO3ym6cscW1e/jgZs
         hsIkrb23RaA190zDwE3XWiduHAhEdrMyhW1pXeGc+60OTTVxhv2qCPyfqdEttkqFYcHD
         C7tdbBz+AJfDw7MOCN6VojNT9dFMhiAgR7amj3eKDI5fOlxdW7lGGUIi8KUm+Eq4CBVG
         wllQ==
X-Gm-Message-State: APuU4Z87p3Xy8Ue3aOrebc6TFF6I1dqQ3L+hO1/MNZDQuyPAdCodYduy
	eKd1LghqsZTgSILL9tnoVzVxax6bKR7Hs46xkSqXO0g7K7UNaoWVaPqdQkCozpYj8G8qRx57Ubj
	qNdXYidARrfEHVq2/OYq7jt0WR1zYThk1GRrpBclEmA5Djk7QeohO+arr80l8L9E3o+yP4t8rI6
	/scA==
X-Gm-Gg: AYBFou1BnkzIRdjNwmSH7D2uFMjuDPmc9Ki7c/b+DpV5NmRqZLbV1N/2OtdAyVwEF7a
	y6ZK8LgIUs5xCiAfOyaage18KoKGA/4EEMDSAOWxDKjKVh5YDQm/97/WHmq0u+hcSm5BPpxjGqL
	RhWlFWwRXvKrbHFR63WYpqNBHlaTFrb9dbMOiZiLQKs2T8eCXiq7X2W9KRgsxw3SWc29kI6S+HE
	40wj27wU9WGbu3MaeGYhXkraMauT1I+uFMcLHUJoY73uqiXA5zHQGukKrnxZGBfeiELFzE2IdZj
	Bgr43/YOQ4fMYftt0MrikFlb/Gq1HBzkw7ZJYzoZ3L+/e5cYH8oCjnnZmge3afSZF87ZygKMlL9
	xYTDB1g/KL44rDI47Y/qRBm0WE3VIIsg5npwZ1SYvaiWRNyZqD1e1sMNCSLlvybVtwTwDLTAboh
	UVoJr9oH97wg==
X-Received: by 2002:a05:693c:8946:10b0:36a:270:ce76 with SMTP id 5a478bee46e88-37520ef60f5mr1866375eec.33.1794285186680;
        Mon, 09 Nov 2026 20:33:06 -0800 (PST)
X-Received: by 2002:a05:693c:8946:10b0:36a:270:ce76 with SMTP id 5a478bee46e88-37520ef60f5mr1866335eec.33.1794285185879;
        Mon, 09 Nov 2026 20:33:05 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:05 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 03/19] wifi: nl80211/cfg80211: extend NAN match indication for discovery offload
Date: Tue, 10 Nov 2026 10:02:26 +0530
Message-Id: <20261110043242.2012238-4-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af29e84 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=spFzIXTjos4xR46HXNYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: pGvDE9kSIzj34u_nzS1XtHOOOAbkHWh_
X-Proofpoint-ORIG-GUID: pGvDE9kSIzj34u_nzS1XtHOOOAbkHWh_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX7eHE6ol4uRRk
 +ZEBk85rvfANdeULUB6w+cVj50vCClxAoBaN1yH8FdNRtdDWTODzCD11SDuco8HJzQSs/7DbwMX
 dtwEl0c8QCC1VKuJscjSo0cHsoYq8HI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX3g41Fb/QCsDe
 qjXwU8cF0JfnAIzJEObWzUk/TdKQCOwP86KWGszFNgnR2P4R+a8grxuGmnmKV7NE7lO0JRzy8d3
 FUaonBlPy0hDQbkIT7wT0zrW0C1fLubh3pLldEFwhJWJz2S7wQUafD9p3T9RzuSOachH24dLtfK
 XUyHzfzS8aurCEh/eow4gN1oCNF/1wtBUfOo67fxmldUudNZBUKi1QA/kLOFBBYcFeO57YUr8Jj
 tti2bmzS6KDuXRtXbSV+2g6YlwhWtkac3vjA9SifbG+43myL8B4gy4p6lKPI7IxS/tUij6FqLlY
 W0k0nLCvO5UamITDWaIUCKvcf5kJnz5OTQeJOu+eMFlBOIXKmOWSs1BFbBtweITDYPSQ28TMfak
 0nbxE3NWM9B1Cflvp2teZPSPdOQY0PVIxe3MoJphkSKyymYYf/KAufdKLoyP1XJkL7ZkAMqJWB/
 G6gGRComtm/ROseSVVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100017

Allow userspace to inspect every attribute in a received Service
Discovery Frame when the NAN Discovery Engine is offloaded. Such frames
can contain SDEA, NPBA, CSIA, SCIA, DCEA, and extended SSI. Report the
complete received management frame, including the 802.11 header, in
NL80211_ATTR_FRAME, along with its frequency and RSSI when available.
This lets userspace parse attributes without requiring a separate
nl80211 attribute for each.

Document that the peer Service Info may contain the SSI from the SDA or
the SDEA.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 21 +++++++++++++++++++--
 include/uapi/linux/nl80211.h |  8 +++++++-
 net/wireless/nl80211.c       | 13 +++++++++++--
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 11d5650c23c5..285aa6991efa 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -10584,8 +10584,20 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f);
  * @inst_id: the local instance id
  * @peer_inst_id: the instance id of the peer's function
  * @addr: the MAC address of the peer
- * @info_len: the length of the &info
- * @info: the Service Specific Info from the peer (if any)
+ * @info_len: the length of @info
+ * @info: SSI from the peer, i.e. the Service Info of the Service Descriptor
+ *	attribute (SDA) or the Service Info of the Service Descriptor Extension
+ *	attribute (SDEA; extended SSI), whichever the peer used.
+ * @frame: complete management frame containing the received NAN SDF,
+ *	including the 802.11 header (optional). It is reported as received and,
+ *	for protected frames, after decryption, as with received frames reported
+ *	with %NL80211_CMD_FRAME. This lets userspace distinguish protected
+ *	(Protected Dual of Public Action) and unprotected frames.
+ * @frame_len: length of @frame
+ * @freq: frequency in MHz on which @frame was received, or 0 if unknown
+ * @rssi: received signal strength in dBm at the time of the match.
+ *	Only valid when @rssi_valid is true.
+ * @rssi_valid: if true, @rssi contains a valid RSSI measurement.
  * @cookie: unique identifier of the corresponding function
  */
 struct cfg80211_nan_match_params {
@@ -10595,6 +10607,11 @@ struct cfg80211_nan_match_params {
 	const u8 *addr;
 	u8 info_len;
 	const u8 *info;
+	const u8 *frame;
+	size_t frame_len;
+	u32 freq;
+	s32 rssi;
+	bool rssi_valid;
 	u64 cookie;
 };
 
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 4037a0f78ef6..38dd596b54c2 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1127,7 +1127,13 @@
  *	only a subset was changed.
  * @NL80211_CMD_NAN_MATCH: Notification sent when a match is reported.
  *	This will contain a %NL80211_ATTR_NAN_MATCH nested attribute and
- *	%NL80211_ATTR_COOKIE.
+ *	%NL80211_ATTR_COOKIE. It may also contain %NL80211_ATTR_FRAME,
+ *	%NL80211_ATTR_WIPHY_FREQ, and %NL80211_ATTR_RX_SIGNAL_DBM so userspace
+ *	can parse any attribute in the received SDF. The frame is the complete
+ *	received management frame, including the 802.11 header. It is reported as
+ *	received and, for protected frames, after decryption, as with received
+ *	frames reported with %NL80211_CMD_FRAME. This lets userspace distinguish
+ *	protected (Protected Dual of Public Action) and unprotected frames.
  *
  * @NL80211_CMD_UPDATE_CONNECT_PARAMS: Update one or more connect parameters
  *	for subsequent roaming cases if the driver or firmware uses internal
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 1331fe716985..44d512675065 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -17850,7 +17850,10 @@ void cfg80211_nan_match(struct wireless_dev *wdev,
 	if (WARN_ON(!match->inst_id || !match->peer_inst_id || !match->addr))
 		return;
 
-	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, gfp);
+	if (WARN_ON_ONCE(match->frame_len && !match->frame))
+		return;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE + match->frame_len, gfp);
 	if (!msg)
 		return;
 
@@ -17869,7 +17872,13 @@ void cfg80211_nan_match(struct wireless_dev *wdev,
 
 	if (nla_put_u64_64bit(msg, NL80211_ATTR_COOKIE, match->cookie,
 			      NL80211_ATTR_PAD) ||
-	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, match->addr))
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, match->addr) ||
+	    (match->frame && match->frame_len &&
+	     nla_put(msg, NL80211_ATTR_FRAME, match->frame_len, match->frame)) ||
+	    (match->freq &&
+	     nla_put_u32(msg, NL80211_ATTR_WIPHY_FREQ, match->freq)) ||
+	    (match->rssi_valid &&
+	     nla_put_u32(msg, NL80211_ATTR_RX_SIGNAL_DBM, match->rssi)))
 		goto nla_put_failure;
 
 	match_attr = nla_nest_start_noflag(msg, NL80211_ATTR_NAN_MATCH);
-- 
2.34.1

