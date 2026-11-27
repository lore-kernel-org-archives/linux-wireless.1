Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=125.209.209.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791551;
	b=N/+cyAn3M+hRGm1VjLEVKgVoXtyQjPtwgwvPnZypkq1AVyiy2JPWR56Ekk45ba+VifTa
	 /0nD5GNXm2/KleeCVCExNNkegs9kkrmAIoDaKXRxXQNo6dJt3sDIcCZSFPgloDmdegJ70
	 rLhbdJOPtJHqRDxCYJMwjdaNXgV2Okkr/M3nJ+WVmpXg8fBdelNkkUqRmItORd6C2xjcz
	 SuDTQGBJHLC1hcKgAbqc+6bnuOl09GxRcFD1I7NdMDIlrNQRenbNVzaMyS3Vh2/AU9Qdr
	 IYKqoIxpzoGXymBwMZzs0oUDgBdMA58ByLjnnFHwqVm587KgKPlVjTbWSWK7DnMGSVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791551;
	h=DMARC-Filter:DKIM-Signature:X-Originating-IP:Received:DKIM-Signature:
	 X-Session-ID:X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dvCZN//yTLLmg/PsIaHQS0jlrOAtQcUQpiWUT1I0tEg=;
	b=o+YQ3j7yIB3toZEjnt8gjv4G7cpd0vSm1Dw1kBobVVf6nnsLZ28h7BkLOJY9pCTwXOpQ
	 gFBrWgvKnHkbYcA/S0J29IZ5iKzrtgcOndGGZfhl1kDFo8rFYUjjudJsSuolMM8uzRafF
	 PlNTMmnBvjwqGyyjyLOVFHTgfmsPOrG63EzBbqXcrnW7n3XXZ+G3Ckir84ezY7kPfuVT9
	 twu7N9w81YeeJR4NZhGhLQAiIaySzHiIJ7mjME1Qq3Z3zU3tocCwwLYaJ4om5y40ZyrD3
	 sqNi/2UGWQI6i96y+TSdbCYZI3Caz4dolTujxtqgys2CHpiwSQq8yHAEAlL2RWqMUug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=skku.edu;
	spf=pass smtp.mailfrom=skku.edu;
	dkim=pass header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=B40r1NUl;
	dkim=pass header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=XkZJIriY;
	arc=none smtp.remote-ip=125.209.209.39
Received: from cvsmtppost101.wmail.worksmobile.com (cvsmtppost101.wmail.worksmobile.com [125.209.209.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20BE606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 14:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=skku.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skku.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=B40r1NUl;
	dkim=pass (2048-bit key) header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=XkZJIriY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1795791548;
	bh=EFXoXcuk5YHr6ms9v9PVQeSoAar5ygtbVBxXI450pZ8=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=B40r1NUlszEwTFSn2K3TnY4Y/OM5lwEE6nf7tflXnUDM7HmpizPtsEuioolIe0EQz
	 lYQvGoG51JCIcUGt0kH8rrvZ9SMD0raYPHa0gVuivQTUS7CHPyW2l11+3zuEFVHfUA
	 pOAlIO2huQoyb+uZVlpIIsumT8jGmx2mBV0yZgQUJOctYAG9UVtsAK6Dfmp7BfPPL7
	 KyaHsjWg6BopkyzsIoSO3roSxykz2IkBLQwwyj/yooZowrz0DY1/5CuyhoPdpETqLB
	 vsBviC81dCmeDsvf3XwOck35kSUqQPX1UKYw26wfFO2ttgIk19ZzrLoV1fOyqb7B2/
	 hh9kUmFgOwWxw==
Received: from kr1-hmac-real-3 ([10.174.201.129])
  by cvsmtppost101.wmail.worksmobile.com with ESMTP id FDYPhEv2QsG240FxxIia-w
  for <linux-wireless@vger.kernel.org>;
  Fri, 27 Nov 2026 14:59:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skku.edu; s=naverworks;
	t=1795791548; bh=EFXoXcuk5YHr6ms9v9PVQeSoAar5ygtbVBxXI450pZ8=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=XkZJIriYfQ6KmNU5VeIgXw8J+jwv7/trIJAMYie3Hqy6OfBLRXBeH29UsM+kP1GOx
	 xA/P25ueke5EoPvXTXTHvS4HLWvFBWXEIUYqj+mAOYXR4Uu30+E8TCOZ/7c630pEUy
	 v/zjxS+JfSEV9vVhVlC/jBvP5xx5nHwBQBS843za3oeITAo09SonZIBHb3yRPxktRV
	 4GMVHTmrLvMD1hMeYeQIzByXGP5XJHCrixnp2dsbZjn0lLWykDmQ/jC6/zHC7TgzR3
	 Fv9EHIelhViGFzN/7S1Q5gH5IYLSa39N092oydqsgDypQ8WLrajNp+3cMtotMNPDSJ
	 nF0YJIMG4b75Q==
X-Session-ID: S1x-N3lkTf23fhFEtfatRg
X-Works-Send-Opt: w/KXFqgmKAKmKAFYKqMqKA2mFAurjAumKAgmKxEmKqK/aAtwaBmmjAFYKxM/axKmKo2rFBwYjAg=
X-Works-Smtp-Source: Vdn9FqElFqJZ+Hm/FAul+6E=
Received: from d20be28ee783.tail196be.ts.net ([115.145.173.180])
  by cvnsmtp103.wmail.worksmobile.com with ESMTP id S1x-N3lkTf23fhFEtfatRg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 27 Nov 2026 14:59:08 -0000
From: Kyuwon Cho <kyuwon.cho@skku.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Luciano Coelho <luciano.coelho@intel.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: don't keep the AP of an AP_VLAN that failed to open
Date: Fri, 27 Nov 2026 23:59:08 +0900
Message-ID: <179578858734.1979329.7455012088537258029@skku.edu>
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

ieee80211_check_concurrent_iface() points sdata->bss of an AP_VLAN at
the AP with the same address and then checks the interface
combinations. If that check fails, for example with -EBUSY while
another AP is switching channels, ieee80211_open() returns the error
with sdata->bss still set; only ieee80211_do_stop() resets it, and it
does not run for an interface that never came up. Once that AP is
deleted, opening the AP_VLAN again finds no AP, but sdata->bss still
points to the freed one, so ieee80211_do_open() succeeds and adds the
AP_VLAN to the freed AP's list:

  BUG: KASAN: use-after-free in ieee80211_do_open (include/linux/list.h:192 net/mac80211/iface.c:1418)
  Read of size 8 at addr ff11000012d51a60 by task test/118
   ieee80211_do_open (include/linux/list.h:192 net/mac80211/iface.c:1418)
   ieee80211_open (net/mac80211/iface.c:476)
   __dev_open (net/core/dev.c:1764)
   __dev_change_flags (net/core/dev.c:10028)
   netif_change_flags (net/core/dev.c:10093)
   dev_change_flags (net/core/dev_api.c:68)
   devinet_ioctl (net/ipv4/devinet.c:1189)

Clear sdata->bss before looking for the AP.

Fixes: b6a550156bc0 ("cfg80211/mac80211: move more combination checks to mac80211")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Kyuwon Cho <kyuwon.cho@skku.edu>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. We reproduce it with a
mac80211_hwsim radio in a user and network namespace: two APs, the
second one switching channels, and an AP_VLAN of the first one whose
open fails with EBUSY. After both APs are deleted, the next open of the
AP_VLAN succeeds and triggers the report above. With the patch, that
open fails with ENOLINK and nothing shows up. The reproducer is
available on request.

Found and tested on mainline 9437ee8b6cf6 (v7.4-rc4-571, with KASAN);
the patch applies to wireless (35c42b20ac87) as is.

 net/mac80211/iface.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 63a371c79183..cfeabf74451b 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -347,6 +347,9 @@ static int ieee80211_check_concurrent_iface(struct ieee80211_sub_if_data *sdata,
 	ASSERT_RTNL();
 	lockdep_assert_wiphy(local->hw.wiphy);
 
+	if (iftype == NL80211_IFTYPE_AP_VLAN)
+		sdata->bss = NULL;
+
 	/* we hold the RTNL here so can safely walk the list */
 	list_for_each_entry(nsdata, &local->interfaces, list) {
 		if (nsdata != sdata && ieee80211_sdata_running(nsdata)) {
-- 
2.43.0

