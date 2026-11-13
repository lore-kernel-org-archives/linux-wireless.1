Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565391;
	b=ETMGMHRSEtToU9EN4CqjJzyvpmiAupSywDerIbnPar9zgwKsOlQ65ojEN0hy8Mw66Vrl
	 PyF8sSa9f3G6ieHcmlm1e0tvnZoIq5Qug21PuI+SiVgi+qJzIHZHGgm3WMOggoRpMS1g8
	 +VO8QlaLasl6IClqS3PCoDNp4DfXNZkNDPcLZxJ6R80eVWz08fvTpS/G47BXCrZUZm0Yf
	 1JtRecK+dXlNqA2DCa+oVEaaB/PtpNYAy59HWUCCtBnNg0hwJFwhoYLaRJCdHjYBGZTU3
	 iugHPDMLonCSUY2m63uuQ4GJh9c6PkM02Z1fC3eOr5H3+RB57QWM4EsaOnJpU2mZ7EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xz+tn0n43a3oFJSrHUMSUCVvwEuaMEY0kTDVhYVMmmk=;
	b=Xwp3Z6JYl4L85zG0w0x38ZjKgriJYaHb2R9cLQpBWP8hNvVZPWSDh2VVQnWH5JNG1tXy
	 KP4cpKmbwhpnAL4GG2u/6xq9z7f31S0Hyyw58aF7ngpXnYkD+wvFIZd/y4BH5aVCpFtYo
	 BfGL6Pqbqovc0zb/F1xNZ1imgLAZlqJlrQCLMBYwFZ0yYX83BWD8KYwg5oJ5CQM8BDv3U
	 kbusd9pqumYkWKigC2k80H1VqMJNQ0mKr/tEkq+KBoIwboaX9UX+yTRLi7hSiRIcMRrwV
	 rUyWbBGHHep9AhhUSXB6RG9umhDr276OIjHsbY1w+w5TqL4S7QNigdTxeUoBNorsiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3VE9ZON;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcVdpaNj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4285B606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4285B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3VE9ZON;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcVdpaNj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V0On4101627
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xz+tn0n43a3
	oFJSrHUMSUCVvwEuaMEY0kTDVhYVMmmk=; b=h3VE9ZONOZdeZCvWsdKHmzcdSQI
	ZgCtou6gr9U2ym5O3URP0goIspc/AhbEpppNS14ERBI8YyQ32V9tS4Bcv7x0Mjas
	IATZYBQ9Kp+t8+qPqw7hz8it0z5FEv3O8Cg3NpVSEQmg3rvCnUXluuyHM5bn9XC9
	hOU5ESbWJOujQrapM+kaBnduTyXNZWWDbzmgqmdrLPshNGQI0vrY3WjjN4Ok8U9k
	Kw4zYK5KFe4H37Z7kStBuZQLtXjmbv5Xl4aScvp9Vp4qYYcdQIofJSWxXZNX0eo9
	RpN3mVfbQrOPYiwfhygqlTgGUtNv7dBJJsyaSh0pWGHEpkOHjlqiiGNMQCg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjq61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so957333eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565390; x=1795170190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz+tn0n43a3oFJSrHUMSUCVvwEuaMEY0kTDVhYVMmmk=;
        b=fcVdpaNjYQmNYMAsQ4y1E2LxfYtzsT/w6FqJPM1/8lKgBgRseb+gxSeYfQIdbfBt9y
         5+rzUEG+rySRvBZdkQK48MnBNsn8UF5cS1a5drLGpchIerKkUIZiBiYy16tNtYTKFEQn
         DWI0ppTWgEkM7oP5/O78JDgsTt/wQYgDg3eu3NR2Jir2SFaxYlwVMq+vNsFbwi3Gn8rT
         Lj5zQtdpA/p02AMlCbG3j/vET+jeHvLGFPGz8N5KVp+hPHw8PHV4ll36ylp7U096PV0B
         J/nCZuhaZZfujF5CZGrKXG6Vs7ZZ830qsefphEWWVFQ3owu/UQFGogZORoBW/2ZkrDxy
         PTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565390; x=1795170190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz+tn0n43a3oFJSrHUMSUCVvwEuaMEY0kTDVhYVMmmk=;
        b=Gt+uwE1Oql6t+dRrAO8XCUc8JEkSar2nKsk+PyxgRZ94cPuRpsRuh8D6Jl+O7Gl/il
         lmQPOJjX3xX2+/G5ILhU8PCKND0AxFQM8E6ZHvaFu5tTlz82p5fHMO8WE/2nidWAAKIZ
         q184XMZbCM32oGwKqPIgDLY4KNqW1Wwz6WH89sJxOXOAdAwT3KXyvgfMsvm1hxcx+kpy
         lbpOQMC6Dl+O8uexUR10ADkztB699qbiflueqyIaeiU+q7KfeQERTEcF46+SwaDxD9aY
         RCW8XUjDVvfL0UaGDgkpSxSIeyAk8iQoAhJ3OFPtc4LO6s5NE2rN4YKynTvSJHO+cX1+
         Vtjg==
X-Gm-Message-State: APuU4Z9wJxQtAY25QvHzcReGtR8n5TjXYTX7FDS+BsqEuDt/HgA1rJ6M
	zjDuUzGVzehCS5QU9F5HTxC0H8VnfiuY/PRkXQh61BG8hEUabC2sLrZyVzWgF86pnTGRg9kPTR3
	5/mZVd8NhuhfeCnqkY5GI5i0WwT0qIw4nGWbc69UM4gogWPFh+Y1sDRFuOZeh571xtM/a0Q==
X-Gm-Gg: AYBFou0g62RpgQPDs1aajOBLZk4hjTGXN1MXT3G97MTEkRP3DnffJSs3LsCYT5QqdiL
	hoAAlS/lwNBuPC7ITXTb61Aik1wAz2VWaujOxdbDvTGzj0h/lOTwf6ijd2MkTBw51F6RbnBnLDH
	dORrORW2ZEMRRbZBhLrAcYKNWc5gMlx/Ksu069nv9FkRkds/gDnO4iVOcHw8bRQt+6yVr89sbDL
	a9GcITuO0CR7u/VHfxf5qGq+Ts9hXJ8ZdGP/r71eLeJrnLqRMV06F6apWWqH4NCB92BnR8Uy0xM
	l7PUajWVgsaIqRzFRFZ+Kx+W8jobOrlUgBTVye0TMQfWXTjfgcCqF++XSs4QWG1ndMC0SLUo9ZJ
	fKIs+O6Y4FDNNoPx9lHg+/lYuwdCEmxHB3O/qXTnmVGiuNjvuZWl5GtK1YbBIGmuOqv10F9m0W2
	oK6SyhssGIV/8=
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr1747999eec.16.1794565389611;
        Fri, 13 Nov 2026 02:23:09 -0800 (PST)
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr1747978eec.16.1794565388882;
        Fri, 13 Nov 2026 02:23:08 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:08 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 08/19] wifi: nl80211/cfg80211: add ranging results to NAN match event
Date: Fri, 13 Nov 2026 15:52:17 +0530
Message-Id: <20261113102228.1917973-9-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX4lVfwJ+MTef3
 i19CpzMtO6GklBepOwqLr9+38SomGHBgF+f0kMAXhh7Y/aYwo8RmuUkF6gvECRFYZZLEg73nPzf
 aQmn5mSXkoVpLdy4sD5DnR0AgWGx9m8=
X-Proofpoint-ORIG-GUID: oLy_o1pi7UT09aJEeJZx3wY4s-x79M9t
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6e50e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=HBrtoi3ke_hx9toI9_oA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXxsmMnx01UsTB
 vpwvk8dClIfxgI4P5o78DRA2HS+cp0Oc1/PIlXGKDPIQhOQQLdeuTrlyK+11GpK2hCAd5rHAZrW
 cJ0pKX5gSW3q6j9Uo5h21Rynzfki8cnckFBgT2lgEe+ofDpfa6KEHagPdmyMwWnSbMVZQ7XloGp
 MTnmIZfBUFb7ywKCeNeTtZ5a3VN/4iUuhF+1TJUToEjjFzNNs/e1y4q65TCeGFOmMudDPZGn+Il
 Rrzy4z7rTk3cVV4bDK9aDZ+rHOcp/3PLXxLbKY0+wXje1/eArcHSliC9/YenxIi4EH3vJoovKYA
 4EzPppgwcRnaYSIGC//N7zxLK1As8TPmV0JhgsqnS/LNTJf0lG4EAP/OOGLCXRvhKgxludMzWRB
 h3aTsW9k2J0lFpieeYkz/tsZ6yPshGSdee3ghK7TuX+/slVC6UsdHPmAWMhJ+vTsv4xRTkbv2ft
 B+SKEm9cOp6Ia39sS7w==
X-Proofpoint-GUID: oLy_o1pi7UT09aJEeJZx3wY4s-x79M9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Extend cfg80211_nan_match_params with ranging_indication and
ranging_measurement fields to allow the driver/firmware to report
NAN Ranging results as part of the NAN Service Match indication
in offload mode.

Add the corresponding attributes NL80211_NAN_MATCH_RANGING_INDICATION
and NL80211_NAN_MATCH_RANGING_MEASUREMENT and serialize them in
cfg80211_nan_match() so that userspace (e.g., wpa_supplicant) can
receive the NAN Ranging Report along with the NAN Service Match event.

Send ranging info to userspace only if ranging_indication is non-zero.
ranging_indication is a bitmask with four valid combinations:
- bit 0 set: continuous ranging
- bit 1 set: ingress condition met
- bit 2 set: egress condition met
- bit 1 and bit 2 set: both ingress and egress conditions met

Leave validation of the combination to userspace (e.g., wpa_supplicant).

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  4 ++++
 include/uapi/linux/nl80211.h |  8 ++++++++
 net/wireless/nl80211.c       | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6bb840a1aef3..9acb657a824e 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -10770,6 +10770,8 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f);
  *	Only valid when @rssi_valid is true.
  * @rssi_valid: if true, @rssi contains a valid RSSI measurement.
  * @cookie: unique identifier of the corresponding function
+ * @ranging_indication: bitmap indicating the type of ranging performed.
+ * @ranging_measurement: distance to the peer in millimetres.
  */
 struct cfg80211_nan_match_params {
 	enum nl80211_nan_function_type type;
@@ -10784,6 +10786,8 @@ struct cfg80211_nan_match_params {
 	s32 rssi;
 	bool rssi_valid;
 	u64 cookie;
+	u8 ranging_indication;
+	s32 ranging_measurement;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index eed7b015bb20..23d19a6e8d81 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7968,6 +7968,12 @@ enum nl80211_nan_srf_attributes {
  * @NL80211_NAN_MATCH_FUNC_PEER: the peer function
  *	that caused the match. This is a nested attribute.
  *	See &enum nl80211_nan_func_attributes.
+ * @NL80211_NAN_MATCH_RANGING_INDICATION: u8 attribute. Bitmap indicating
+ *	the type of ranging performed: bit 0: continuous ranging,
+ *	bit 1: ingress condition met, bit 2: egress condition met,
+ *	bit 1 and bit 2: both conditions met. Only present when non-zero.
+ * @NL80211_NAN_MATCH_RANGING_MEASUREMENT: s32 attribute. Distance to
+ *	the peer in millimetres measured via FTM.
  *
  * @NUM_NL80211_NAN_MATCH_ATTR: internal
  * @NL80211_NAN_MATCH_ATTR_MAX: highest NAN match attribute
@@ -7976,6 +7982,8 @@ enum nl80211_nan_match_attributes {
 	__NL80211_NAN_MATCH_INVALID,
 	NL80211_NAN_MATCH_FUNC_LOCAL,
 	NL80211_NAN_MATCH_FUNC_PEER,
+	NL80211_NAN_MATCH_RANGING_INDICATION,
+	NL80211_NAN_MATCH_RANGING_MEASUREMENT,
 
 	/* keep last */
 	NUM_NL80211_NAN_MATCH_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 7b55a34a733f..8d4e98fcedab 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18042,6 +18042,17 @@ void cfg80211_nan_match(struct wireless_dev *wdev,
 		goto nla_put_failure;
 
 	nla_nest_end(msg, peer_func_attr);
+
+	/* report ranging info only if ranging was indicated */
+	if (match->ranging_indication) {
+		if (nla_put_u8(msg, NL80211_NAN_MATCH_RANGING_INDICATION,
+			       match->ranging_indication))
+			goto nla_put_failure;
+
+		if (nla_put_s32(msg, NL80211_NAN_MATCH_RANGING_MEASUREMENT,
+				match->ranging_measurement))
+			goto nla_put_failure;
+	}
 	nla_nest_end(msg, match_attr);
 	genlmsg_end(msg, hdr);
 
-- 
2.34.1

