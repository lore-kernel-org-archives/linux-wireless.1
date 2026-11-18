Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983784;
	b=MsvGoJKHAOU78yZXPrquxmT1v9xlfHdqca33fgW9exYMOB1r2OWjy/25s5PgFQZXVqPF
	 6mvT+RQF8DRDe0+w6lJKYs9ggFvIsagqmGTxx+lvyokTnOg8xWZux7fLHi99IOuvpwSqs
	 ll5gMq6Cp7IMLgN7sm4b99Sy9mX1oeouwQwEBGca8IhWlCHoYh0ptBqHOkvSXCWEH8Rc5
	 niDoP62m5hir5g9JgWkqu7oyYuxG9gjcfVBDlxKrY/OSlZHKJvhbdqOLVYYrFivD4iU3y
	 izXw8uigAfzGJ+IhzMHrb+h6dxS2fWp2ywVHC7y8JjHA5pDeUkRH4wkJrgL7n8xD4+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vNZDB+RE5mRPvE+XzgT2bAOEQ8fkBPoYpxM5Ivm7pEM=;
	b=joqJK/8bN9GFx7+oPs9QBKcG3H78Kdo2iOPm3JF/VmxKBisZkDLuGLvtZZY5TPG/KGpP
	 yI2yGgH/clchpuwWkvstIThZzmFF0eazrYqpF1khNIJHlxAe0KdFP3bQzNMln6cGjTU19
	 5835GwbSbOheMHAqc3gPJ0IB4V+6KJI/eizl6xDp5HSMZcRuvTwMXarvTnDgIn0aGMD9A
	 8DF9iNT2keu7/M6NCegrDB+A/NQDagPB59/zjIZvCFZk21gHzZDKYJnV+WjQNdJ4igu+5
	 x/eEnh5ErW0718PdT/gMkCPMpYQ3ramlmSJRE8nJGzaATY8hwx+HWDirh2tWuGsCUEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aw1X+A4B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fyUP+jRb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A373606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A373606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aw1X+A4B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fyUP+jRb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UrYL2383072
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vNZDB+RE5mR
	PvE+XzgT2bAOEQ8fkBPoYpxM5Ivm7pEM=; b=aw1X+A4BjvF+f9wn/1dUuv7OQ3n
	kBf4Zf5riFiJJq0zHbxjQh2mTS0rRYzo2o/qPIsU41h2MWjN+qIqAk2dYMkFuhUp
	cfhfjz2pAHCr2Fxpfq+7ImWhl/NCdUCR5+Obf2v6Vdd5PKmUIKcAAsgAF5JJhwKu
	mxWmkissIMxtJ4eYSWxGsEoV8xzEtJrxH5tdK5kS6VE+RqrpFTZpU5dFvuGEATmj
	YpGuzNdwH/ZXArmmbkYeacfAvQOcz8MlI4CwJB2wmIs3XA2Z6BKNh5h4rlYeYMSs
	HvIaCX63L9Na/PXkwFmWPZyL3D9MkAvbkS+fCfCOgTH3wYxp+azRBRXYPbQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasmcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso792068c88.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983782; x=1795588582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNZDB+RE5mRPvE+XzgT2bAOEQ8fkBPoYpxM5Ivm7pEM=;
        b=fyUP+jRbAs2iztepgTzX9Hs6PFPG1DYp/9SY/cTxR67eFsr35PPeVGamVJbXpLa66G
         IfRr3b4ajvbVF9OZSXIoTHIBPSb6mwj0ilY3QTUQMoXRym0vdF3BgRlp/vsTWhtErTBU
         phF3SW9c1DnywXtLjysj2w3dJUcIPzue7nXgBCqmNMzrC1QXI4xPFksd54Ztzel62GQj
         OVriAqpkTBFDkdyPzvKnvBUe9K47oO7y+43dCGQuE4o0Y6MGrdigc56YbnwCJwRTkUQ8
         vNncNpnafyEk3nyUHdPF9YUmHDcBePGmoKZumqjTok56/oLqtYW/NHrI76CESceP0myh
         yxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983782; x=1795588582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNZDB+RE5mRPvE+XzgT2bAOEQ8fkBPoYpxM5Ivm7pEM=;
        b=WtglhWxgasfMQ7qn3NbNZsl9FVn0pzzy7zo8vH06/o9IYUSVkcJ380e/FVsPmN5jmq
         v2d2dhjz8dTWQDWmbwtaKh3IXbXhxWVCiXSqGKwaCBxAtCcJK4Tg90PTLcxwif9euR+o
         GPsT5ccWfS022B6FobuwYI5ze6T1r0TMc1z9bS20Zbbc6oSuKPAUqeqGaPs75x41ueR+
         67aLVJBx5A7KdgtKC4skipLyKsP4m78P5KLfWD5cCTmveVHJM2c6NQz+DMJus5Y948H9
         IO/+mV1833sAr8PJxGB+BkzT8ZbT2zQc9KkmiL6yCMNtcSTW8EAGoKAz/NLDpLZR3nW3
         Mjgw==
X-Gm-Message-State: APuU4Z+k4ayPEZpakGFVBN9HPwk78/pJ8JG5EiTTa/BzCBq83TdAm8Au
	rSeyn8DaA6Jp+JGPkLHhyg1XC1VKH71V7zC9/nKMPQgrN/tAGIQqGTa1Vs0j+N5BnPWBQaVl1Q7
	Tj/GPPy7wkH8Hsc31ylq7sLbu9TjySu+fPw2UajGu2OMSEkKQLQY4OV8PuUlFatC9LcnPow==
X-Gm-Gg: AYBFou2LNVzAbcF4VXqtuOL+rMs9C397TgyBPE6YBBVUHnG5bH8d31zxn6+I18mTgWb
	wRzteCWUUZ53cyNAQa8GKAtcpIX0XpXjrn7oSvdktYyq36MkRSE9bXwH1Sr7LitPyDTwbY5c2Md
	RNaIfweYCdg6YaBYfXWyxoRZNGVsfbDOzgVoxIUgeMYKPe6rvizB1ScRCXeAb3sIzn9NA+LaBAg
	NLiebOfUynk2LcqT8jEocD4ykTuv7sqUXzkfsib2SoI5IGgtOAqVPFf6l8k0EVFziXMMfDRas5X
	D5utBDsEGcM1J37o+QRSRXgnMPsRrH1vZH8GlpIFVAjNH0S5j6vD6ijIJQhGCPpXXH7NHfmJGwJ
	eszbTS1RVWQnKPdac9FD9kFKAZR5I5M5nCLvTNn4o0wjoCtcDwoUE7yfbbM0yU5S56pXB+NkBLv
	0AD1210segDQ==
X-Received: by 2002:a05:7023:a8b:b0:1b5:3e3c:142d with SMTP id a92af1059eb24-1b543d4f82dmr1737623c88.42.1794983781798;
        Tue, 17 Nov 2026 22:36:21 -0800 (PST)
X-Received: by 2002:a05:7023:a8b:b0:1b5:3e3c:142d with SMTP id a92af1059eb24-1b543d4f82dmr1737601c88.42.1794983781014;
        Tue, 17 Nov 2026 22:36:21 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:20 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 03/19] wifi: nl80211/cfg80211: extend NAN match indication for discovery offload
Date: Wed, 18 Nov 2026 12:05:38 +0530
Message-Id: <20261118063554.2260397-4-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd4766 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=spFzIXTjos4xR46HXNYA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: yXQZLXdjCxWey2Q00ZwAmjY1pIyKgoDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX8RYjLeK4XiGt
 jKFSUgsWFmjVjVc4HCGYcs5Adafb+uv/bfdJ/aYuddQ0KpbFAg+ui/mERD5oxrWgWdhLo1aNXhY
 Nlq0R8knsTz24ub6JrqQXMIPNl9q193nDJufn/SH3Vym0aswLZbNKRJ2HmSJcW75pZkesA/zfDK
 3/t89SCuOTD999vGLNuocD5/YKaAjw9HBUgylpX1HlDIYLqlM4KDoDIplx5EX/NbTCvfwmMwPWw
 YWwKr9QttxvALsCfBRFGRTF2RZ8Wr1Ho+gfGYlMIdSpR9WhGiZDz24SPTwUZxwQ50Zqcvzy0FsP
 6zIk8SUN4VftH/3ECJcXmLactYtQiArv351AQLjWkk2J0CVJqIbSLl7ylz8ccDXXkUGCsP5UxdQ
 EsWXOvwt8ZNP4HPZvpP+eatueMu68VB40u92XRH6vuoRcMP6PMeP7OdUKRgnyI56vKRcRZ33UY5
 F7jUE7qF6PTSsEXNLPA==
X-Proofpoint-ORIG-GUID: yXQZLXdjCxWey2Q00ZwAmjY1pIyKgoDx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX5rxASTRUT0Qt
 jfIHsD38jZ0DbQ7I/IUhPI0s4WOZ8NYpLe8oZ7rZNpqYLSe6pQPTCqk6eyYbs/LIO8LpfQupHDI
 57ml8ifW7CtrFJpGh/OJKxWP47iGlpo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

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
index b6e4cec22652..9f412fee8fe8 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -10716,8 +10716,20 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f);
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
@@ -10727,6 +10739,11 @@ struct cfg80211_nan_match_params {
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
index 55fc50519f8f..c30dcba96763 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1185,7 +1185,13 @@
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
index 6847d1cfc4a5..3375aea01e0c 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -17869,7 +17869,10 @@ void cfg80211_nan_match(struct wireless_dev *wdev,
 	if (WARN_ON(!match->inst_id || !match->peer_inst_id || !match->addr))
 		return;
 
-	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, gfp);
+	if (WARN_ON_ONCE(match->frame_len && !match->frame))
+		return;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE + match->frame_len, gfp);
 	if (!msg)
 		return;
 
@@ -17888,7 +17891,13 @@ void cfg80211_nan_match(struct wireless_dev *wdev,
 
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

