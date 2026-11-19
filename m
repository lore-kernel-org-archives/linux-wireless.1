Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077835;
	b=haZkVfLXlNpRONmY4dpIo/YwOPdduVeiw7xDVhuxEVRgvB+ZTOzS3DeW+GeNWsS297KU
	 Z9wH00BDDLMIhMH90oYZMVj4ws1uJTqgB+kOrQ0i0IHxJGSlKtM2vwGZ7Piw4cf0yzg3p
	 GtNHmpE+gMbY1mYgBX9d5XzNoV89CwN2NJzIC6oH6KGMDIkekP68Ep/EOAWxUZwXJcCOj
	 aMxa2K2YmVps65uBfUSlZDtPyAJuyIpBUqJ/Rb0JGn6e2tB7SSdGQVKxCurpFfxRiSa12
	 bvuiWRxx4vbDsVCnn0DLb79IbJ+bn2msSVBuq8lPCh47DqCJycU1Zy2dn9lJpWVX1FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JazLB2oOS7FZ9R+ZOVhTAWbJ9ttNHUoU7vKQ6VHbWMQ=;
	b=paUYTkSbrQLQWA1FiwBkcwm5TnMQ7ehHmIvG6RSQlKFl+TgrJ4bh3sUXurNLPfEW57HS
	 Meyz17ncgkNSyStesX6g7E2Bj1p3qhmfdYt75jgZKtM2JppLp7gW4xGReNbbbi5Yx/slR
	 LxfVspNkeGaOnVmlfRPXJlwcxwx3t98pi5TN8qWCF7ugRh3EJi30/KHU6hhS9ou9W/hxm
	 74EWJQAKDa06C2bT62L03YTd00VFMpEX6QMMs5n8hwVG+l0nnaup0UQWPI2JOgX+lbpRR
	 /0tlO4DzcB4TwIGgC9bBvW6au5IxZ/bd/n9ChWA42XPtZVUynU/zALd4zoqo1B8wOug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HOwuwGlx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kwLuzbyI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40C606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 08:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D40C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HOwuwGlx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kwLuzbyI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wKAX1007326
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 08:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JazLB2oOS7FZ9R+ZOVhTAW
	bJ9ttNHUoU7vKQ6VHbWMQ=; b=HOwuwGlxaI4tPTSOcw4/6IBfX2PXYeYiI0zQtQ
	/hFVN6BGa4Xj/vjumZNtDeE03m6C0r5pnMj6h3SZw1LWZf65sd98ODuKqPAvnNJi
	BWsgPsel9BviTG+E79UVFxJVFzRhxNKCwuTCsFOqEaaTe4LfgcnH1z3deewYqEzj
	f8sjKa6XGYnIlVt7LmT2bo+PF2QkAm96zb5IDiXm8pHfJdIobf2FOQRkLngGJcU/
	aandX4K01o6a3jxOEQPhJtyycE4tW2249/3jiMZjERlJHx7NxXwaMxudf6/jHE3H
	00hZV8lOE27lw6gDuG2niA0EIRucmjLao2XZErEAO4Yqmcww==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnuv78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 08:43:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1480164a91.3
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 00:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795077833; x=1795682633; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JazLB2oOS7FZ9R+ZOVhTAWbJ9ttNHUoU7vKQ6VHbWMQ=;
        b=kwLuzbyIegtD9dmcPZ3UzbWOE0o9s7DFvYdfZKRH6ed5t71komwfVDzs++U1JDKKpm
         NpaEfdLFNVvZ7uudxDhjIMmyO1BUd/XCB61pWxDzHW2VsQA6Z+Y2qBUbx3DAhl9BpiLy
         SQAdd8ZUCAI/Q2WeXuDj5eZ9OaHtnPxhhMhFJ2B3qLGyUi2xvS9Z+sY/m1ITNM0DFmiW
         S0ZGI3esrI/xDssTK+24PovH+709vkPj9jJcsvXwO5Tth2aWQqC1SDTH+B4bF22gk5KH
         Ig90gzG79tLANbDM7LtvFmxAmQQqA0MC93rsuzxLyDfYyZlau12DrfNK97X5lqotMRoS
         GFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077833; x=1795682633;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JazLB2oOS7FZ9R+ZOVhTAWbJ9ttNHUoU7vKQ6VHbWMQ=;
        b=UuiEdkzT6BTidqzRyWS5V6czvq7KqbxXEheUyE0ntjtoi/zhWjXbBCWHlVrZf18H3l
         aPM8yxccPXS9nGqcB6s9Mmqq4kdL9bB8bpELQ6nqfay4mQhTGNRaX29so3UBLeYr+Un7
         n1j0voVeQMTfsr69JeMq9VRC1uMANeGAkaIrx7TMyxFtITtycHlAkaDLkhRt6aXTQMOW
         Jux2mkUoQcV8mdDlSbeKuxpQAZPuqi9Kg6soKx3PL3lTTQ34abKYc/hCqUEfA8OiHN0W
         CjpeLvo5PXmeQdC09i79NJGAaouYM3s34tbtTwf3zhzZBRFn6OM5cN5JhH3JSWzSrdEf
         WdLA==
X-Gm-Message-State: APuU4Z8UHJeUY9jP3DUbkszaF6pcnBdlvbPrjlc8NcEc/KwNwI3iJ2T+
	ADW2vJuYH7dY/vqnRCgWFBwZ2WiAROimZDlTbP5yv5kHUW2czyW7taOg7RE3A2IxdMj+t+hdsM0
	E05BI4+EOSMb/gaZ/Mtj5v47xhfeqeFBtE7ySA46Wb81b9LYJ9Ij//Ec/Gh+jWu4f9qLh6o/0w+
	0JLQ==
X-Gm-Gg: AZFdTZc0V55yaue8y/wCjQ/vk+tFlg5lXrfoQM8+nOvo79sBXC9ziutQV/zEasRMUJE
	HjdvPnlQ01me2k/YpR+38uZNJFDHijRLx82o7Hg2QN/GYVe9ujIPDZNTQROlxB1wAa4Jl4qwv6U
	hLalZW1y8q45fOdSyv9c15x2oMWi4ABKzgXliHpGSwBBmtojQ8ljWRra13E8o1vxgY80QWTK8VU
	nTf5Z2SmJYnBFmhBEe13PrR7c62dC7TLhydCEPg+e6ajMiwvIra13T7wz+hT34S818OqTIjR/kZ
	Yi+GQSr+mkn8EhHGkYq335pUy4YYG+L7A+k7w1hD0ZlWgkNgLAR5WGvbDbRXrDdDyctOhBn7ZOV
	6f1Ha8vNEzq7RPvDqCOeaI2TrZ4Xdn+cGUbPwdMo+Fh9VLbUU4MWNPo7V9jyMjfqOue9QY8i0/a
	irN8xPvbWzqRTZBL+Qoldbu1gg+OBQ7HIxwxrUFbgUwGZn/8X04VvlK1/KxKbelGT+PVr/9RF0
X-Received: by 2002:a17:90a:e7c1:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b3d07e3cd4mr4990993a91.64.1795077833478;
        Thu, 19 Nov 2026 00:43:53 -0800 (PST)
X-Received: by 2002:a17:90a:e7c1:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b3d07e3cd4mr4990980a91.64.1795077833044;
        Thu, 19 Nov 2026 00:43:53 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm1607880a91.16.2026.11.19.00.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:43:52 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 14:13:47 +0530
Subject: [PATCH wireless] wifi: mac80211: Handle AP_VLAN in station link
 changes
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-handle-ap_vlan-in-station-link-changes-v1-1-35f1396f5a4e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMK2/moC/yWNUQrCMBBEr1L22wW30EK9iojEZNTVEEs2VqH07
 o32c2Z482YyZIXRoZkpY1LTV6pBdg35u0s3sIaaqd23vYgMXMsQwW48T9El1sRWXKkUR01P3iD
 jzksQDKETCNWzMeOq37/oSB/NiDCj07bY+/KALz8PLcsKwvtSx5QAAAA=
X-Change-ID: 20261119-handle-ap_vlan-in-station-link-changes-5c1d1e9d51e1
To: Johannes Berg <johannes@sipsolutions.net>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afeb6ca cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dbWhoCd_LgUf9jV8970A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zuYlO8A0KMIk6EdKTPB0bfXI-0FuUreC
X-Proofpoint-ORIG-GUID: zuYlO8A0KMIk6EdKTPB0bfXI-0FuUreC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNCBTYWx0ZWRfX0lqsnRKOHyl8
 vtWJyxYe28YLjp+GbUsWsHrCfkYeaZM9KjfNUG9SbbR9xs0qDNvG0xa34VWOhSCo2Q1ITGMTbPD
 CKPbNcO9nL2+ACvJDZyzEpFLU+m+L5Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNCBTYWx0ZWRfX9/j+AW+QoZit
 wfh76caYUDj2Emxs/ffega3PluExhVnzeeN5rZs4skG3PhlfGaUyV/POMVCpR1fCEtqFaCc8Wr9
 pAQbXi3WN0wHW2GDhAuDrPjpitMbTU0fLL1etm2cxgPveV7bbG2SliLteFi4AQRlyk/BP3ScSq4
 j+SnzC5Mc+laR3vfxMJg/7nkXZjp7CDHOjSx7uXb+rl9KapCPlJZP1bw4MtNCN+Sdzr9mhFayqx
 mQ1nYlFSAPihNfhpWi+KXl4t/p8ztEPOFIsffOrb/BGeNkJk11jpy6BZ+4X+tLJOVOauEZHYo8m
 qfsJO9UOxqZNH5vYNkmYBTtseYSFaxnCX9fT7TjB/vfjrEiqq4RoPy71QsB2DZeRggOI0BphhL9
 BfJMg3leXn7cMcEg87Cnu5DsZrudga3c871pE9c8H7C4UHhxfaUEcO8PdEQBZ3MNB4Qie6zZD6p
 3z4j59cAnE7S+vnKwsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190034

When removing a link of a WDS MLO station associated through an AP_VLAN
interface, drv_change_sta_links() receives the AP_VLAN sdata.

AP_VLAN interfaces are virtual interfaces and are not added to
the driver. Therefore, IEEE80211_SDATA_IN_DRIVER is not set for
the AP_VLAN sdata, triggering the following warning:

WARNING: net/mac80211/driver-ops.c:597 at drv_change_sta_links+0x121/0x235,
Failed check-sdata-in-driver check, flags: 0x0
Call Trace:
drv_change_sta_links
ieee80211_sta_remove_link
ieee80211_del_link_station
nl80211_remove_link_station

This prevents proper link removal for WDS stations associated through
an AP_VLAN interface.

Use get_bss_sdata() to resolve the parent AP interface before checking
the driver state and invoking the driver's change_sta_links() callback.

Fixes: 90233b0ad215 ("wifi: mac80211: Create separate links for VLAN interfaces")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 net/mac80211/driver-ops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac80211/driver-ops.c b/net/mac80211/driver-ops.c
index 0e854b0974de..f810df400f6b 100644
--- a/net/mac80211/driver-ops.c
+++ b/net/mac80211/driver-ops.c
@@ -598,6 +598,7 @@ int drv_change_sta_links(struct ieee80211_local *local,
 	might_sleep();
 	lockdep_assert_wiphy(local->hw.wiphy);
 
+	sdata = get_bss_sdata(sdata);
 	if (!check_sdata_in_driver(sdata))
 		return -EIO;
 

---
base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
change-id: 20261119-handle-ap_vlan-in-station-link-changes-5c1d1e9d51e1

