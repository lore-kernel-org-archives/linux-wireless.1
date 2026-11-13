Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565379;
	b=t0nDhg/JC3f/1aOt+dpGeJMIFKUUdTPUMgoM1+G02okaJvRq5UMzzuXuipPRnx5uWk7i
	 p/jz+9wHUOqU76oAoaeDcZavYlKAK8F5Tefe7mcknL0iFqP+LLEBuioRqyftN3AngPeGv
	 4yXgnyWNiXByIxynb+/at3xYZBSTnGHnhEHMpbnA4O/r5dWGheiHZgwW75etKRmhf+UFh
	 MvLsn4ewM8qH+PElmOq+8Zq+C19hGC2ygVawLlsNqTf/1iqXLJ5pxcm4i2DzYMk63d/Uk
	 jioXIzc0eGB3q4fkb+acW8FiErftleM4ym26OxOi4sVKMJZ0D3iAG6ixIBiLg9non2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vNZDB+RE5mRPvE+XzgT2bAOEQ8fkBPoYpxM5Ivm7pEM=;
	b=y2wlyYYUTlCb+EOm6F5zDHEUzxD2g7gWz1eV5y4L8Bk/ANqrz3zUYOrjd0Ublb/29qvj
	 OJO2Jjyh63LDMplbQ4umCC0ih/cusN7+WSVrmMCqNMIThWIN1yAvG2ssLYKtvXKF9asgm
	 gKz7iJaTwmgHQBHjKw/1I0z7Z1k4/1caAnaUv1M42aXEGTwuLSHyxNLqEkBFp+sa3Vc9C
	 W6esjjHSzSqjaOeaVW7SO2FsA7oV+etLNOtm3GmJCuF0DF31TwMl4okuscQFs7x0bihCh
	 A7leUT+cXZerv02zNN+fZGxRn873AYdiK86bXvTqoUViM6xxpCI7zYVF0JEUv4wlq1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m2FONQiN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iws5c8u+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4456606A8A1
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4456606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m2FONQiN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iws5c8u+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V7TA3620255
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vNZDB+RE5mR
	PvE+XzgT2bAOEQ8fkBPoYpxM5Ivm7pEM=; b=m2FONQiNTAjv4pXw5rytb4GDGh4
	DahR5JmP5MHvV+aStRvl/ARvWWuO9Ws28jwG5KNl6Ml9xkq6KEyGj/UKb7iCZ2Hg
	mClQRVb6ZhhfdF9t9O1jXpYDKxR581WImCpCEnRQehMyOnaxbQoEqslGk7oBIDV6
	leWU+TFGYl4Ss5Spp7pItvZDR5u5d3skqbpTcvhDRRLdnBwKj8EOFZ7rS4AfpJwy
	R/wa8aKvbxku53MZJx2458uc8E0iFaJbzfiEyYAqldMdh2aTMQXIdylXtGZhJ7nw
	vTYhn94SmZHHqTLBfPVl3iA0TK5BiZ2BUl+7Gf959k0UthyvDHzU+rpztGg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja8x8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so2936314eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565377; x=1795170177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNZDB+RE5mRPvE+XzgT2bAOEQ8fkBPoYpxM5Ivm7pEM=;
        b=Iws5c8u+p4EsJ0Qjy9DFBar245tctHO5DGS+0/NdgoAzY9qkvDWJWMUO7AkBAflzhz
         2O89yY7Gj6JsGosK0ooKr3PhicbJOsChmhUHcoDj3epIAoVmUZtcJ8gp5VjSIpuMCoGA
         ktZquBJbT2jbxxf4wf1K7ABGn+7+ZQLMrIp6ah5bfgnOkse7h2lgzAX8i9N0I9mhWJsW
         PKJ7jEgkgf7hvqUObioghAcnAPQkQmzdd/+/nswGNd/BYgwzZRCAS9Rr3tUunN0lKwKM
         23TOiHCIp6R5y2guzamA83eE57j5IQOY4YRSofEGA6ohTwuzNAUg7ja59aB3FPbmCECF
         Yc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565377; x=1795170177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNZDB+RE5mRPvE+XzgT2bAOEQ8fkBPoYpxM5Ivm7pEM=;
        b=ms3TPHXUg82VF4eg5PBSM7BB8taxgu4uewtLdhrN6ffEEySsfYgwKmJeP0eCetDH4/
         osHKiibsON1GiWlVExSpEW1HybZN54t/qCkYKOdUs8s/DRpC/Y6/ZvqmaaEkdWn42aD6
         C6eDrF5jRcSPiPZEkkRJedshvdeQ6XMY+3eqldb/3z+hMILTZLQMwl93dj1kZolIiE0F
         sjYZST8fYCmFDhYWo4NcP/p+wmCx+DJCCGN6aiNoQP8gEbs4A1K+qHK/iVtHC7F3IZvk
         E7Uc5vHbnm0ST1p3aa6W+f9/8S0OD+XgKodWfVEDC3iFsSrzbQ0++Jdb1u2sSoCjUGHh
         10Rg==
X-Gm-Message-State: APuU4Z+qQ8iLT9rbW3QuQkxVpYrWOvEZsROBwsJ03q/lEQrS4DFYoNoI
	zLkHfeixJKE3VMs/b0UmXgFF7+OdEtxu6q13THBlFtlF7hpZTQCOA1ZHVllgSWTN1ELoD+OuHz6
	EhkLnLyz5sMSuySg1OF8wMosjYv90P15I7RTtpTZ/k6XuoB1f++ILSTCzzO5DfopSoD89kw==
X-Gm-Gg: AYBFou3flq6vKjZX1kPUipMdxjGaBF8J+5QjIUJv6+l9vwefNgjP5Xf6PcyvBJ/7XZq
	QmTCyCmoRIQDHLUNe3EvtEGxrOJG5FrI1Ij88aiPOtljYTmVdgUR3wCkFGd2Q8DdYUcpaFSW9Xa
	UV0S1+AF8vljn7a1NTZk8KoYgxBk/p5m42GXL+sZQStvo7Vq+dDPuyYiGyPgLJw+yxJ5twbDqHC
	HjivCLO7XC/1a/FYrqPsrb9+bhpNAd9YPIJnrrAzRLoXJ1KnGZoX5aiL1off2TRxXZkolhGgqv3
	7zXxJtzcbUeqqS0AYuEn4WZhdhC4eE6oodh6njk4WyKmi6D2+tGt8L5J/l2aukXSZFnY3frrhOI
	IFVjpxhk0Vll/k6r6K0D3wbHN8ktB86/zkiSsxrgXBhILoG96LaOWWTKoITH7vGFLQehlIpKlU3
	QRDIIcO5tPgI8=
X-Received: by 2002:a05:7301:19a1:b0:378:314:4041 with SMTP id 5a478bee46e88-37965da110emr1755342eec.16.1794565377053;
        Fri, 13 Nov 2026 02:22:57 -0800 (PST)
X-Received: by 2002:a05:7301:19a1:b0:378:314:4041 with SMTP id 5a478bee46e88-37965da110emr1755322eec.16.1794565376409;
        Fri, 13 Nov 2026 02:22:56 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:22:56 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 03/19] wifi: nl80211/cfg80211: extend NAN match indication for discovery offload
Date: Fri, 13 Nov 2026 15:52:12 +0530
Message-Id: <20261113102228.1917973-4-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: dRUORw9S3RCqP_EqzczG1fcVK9Ix_tug
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX58jPWF1s7ezG
 DoltGyFT1YNw4pAXxDoN9kCQeZUpTvnggXVSeLRxSHZHYnqs/h1bOFZPy+Rkn9QmjmX4JqVWtil
 ZIumQ+t7BR9FKZf3uP0EyeHmNZ8YsJI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX90LcSctwCFob
 P7Hgl1cqPzQgxiqbeExFhFQ9iHP8uO2hh+BEit/9ILHq4OdnL/JC3s30EewA3SJfKgx8X1zgmuo
 Tyivo4OVVx+viXlCWdGsvw7hiqSVlQJCm2CFdIKrGbUokFqQPk+sInva65p/CnNgRVm6tjYyIKu
 4iP7m2KT3JxpIKq9DblZ/RzCgtc9baVlD26eIfPgbLnd+PhoeRWw4g7g7ADs+9ZJqaklaLb9kxR
 lQNv4CkE5soFrdzimUeCZB+kg8j1yS9lKzQNsFow6Mt8WypCR+7Qyvc0OQNjudS+cwedMQMH/Yy
 5sk2HzrefgJhmnX6DEvFP3kFrDwaq4XcODv/3qMJ0MaDjRN3oI+A8RKlshaYmEX4l8NMf+Xw5f/
 YFQA5Zo4matwo5461cPDzFhwzY62ooEW4i93M2k22Rwzea/T6xHq3Ri7n70IDUnwD13nb6tN1YG
 9T1SWTUqkKH5OT5r1Ww==
X-Proofpoint-ORIG-GUID: dRUORw9S3RCqP_EqzczG1fcVK9Ix_tug
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6e501 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=spFzIXTjos4xR46HXNYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130041

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

