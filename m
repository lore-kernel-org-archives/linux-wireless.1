Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985734;
	b=onWNJvewtiUmVeMfotReX/nBGJ2X/gUqwwKdwruM8b6G82/4l3OkEoYchqmX0hQ3Tk3L
	 1wP/wEXmYuQLfH1WK5yAkFxVg8yJwD8dkt92j0fkmOkxHP9UeLmeUlVotgsnK5tBulXQ7
	 m9AWggEz2uL76BMVgCPhfW/8B/G4mLA5LNR5tCJTCcqn03EroSCtjJZ8LmIrwh8rmSiOM
	 c58YX+Q3MxRpWvjCezad9AWETLcWGrFytO8KMwhjK0usRkktPWbk0OnFcXjFK60nuv3jp
	 x/joL33aGBH/r130pXzuNWewVpVq1PdgOhMoHJhFD/8wll1qLJ8mU0RGGWZqwuM/tQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985734;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Tk73BOKWJZl4x7y6b8CgGJQ2haz+VUmMH9ckRu2GRRU=;
	b=i0mcOaSj+Zg9IrfcoHtvxMeyYbj9vjsDs+ZuaL1dmzflZroZJe84DRK3nnYCfXvYlJot
	 4pCoPZtQr0qJbqWalk+kkb73Ja/AszO7XcQa9OFLR0lsdNTgnxHRjnYCthfCSSIcYtHtV
	 EIa8xlOtM5ycg3joMM0tvE6RnULRHd7uFrQTfV08NL07aMnSGQIvXjXFd70H82HoxjJBS
	 gCg3ddTV04m2lCwseAZdGtH3hcYRTR/Dx4ezJZp0qTwLxTd8gsrf9O+JWXKEjNefA06sa
	 smBvlzqgLiCCb3Y2y+kMh08d+zJ2N1DomntDLRJHrSyTMcaZMn1RU7LC4rTPBegmfNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NskjtoUF;
	arc=none smtp.remote-ip=91.218.175.70
Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06A3606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06A3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NskjtoUF
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yaMVr90IQaJTtVO+5bDifQljGhz3023Fv1fLYZpCIac=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794985731; v=1; x=1795590531;
 b=NskjtoUF4noer7yqvnM5Vc0tTs72CuJBr7ste0iBIQpqIYLkRELIo9pIaaHRwpMmiHhchuog
 hlHi2G0xRt19VulQUkdDHVxzN/bXkmM9sootMkeqW1L2BP6VITKor0FyeCURfqUSkiKboolsddS
 nt4RdFvZvKjzDmGBexoHT0HE=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92a814d0e9d82b49;
	Wed, 18 Nov 2026 07:08:51 +0000
X-Mizu-Trace-ID: 92a814d0e9d82b49
X-Migadu-Flow: FLOW_OUT
Message-ID: <2c40e18f-02c2-48d7-b592-279634700c10@linux.dev>
Date: Wed, 18 Nov 2026 12:38:42 +0530
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: keep ARP and ND offload off on the
 BCM4364
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Yossef Osman <Yossef.Osman@proton.me>
References: <20261104151620.70671-1-dev@deq.rocks>
 <20261116203719.281605-1-arend.vanspriel@broadcom.com>
Content-Language: en-US
From: Aditya Garg <aditya.garg@linux.dev>
In-Reply-To: <20261116203719.281605-1-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/11/26 02:07, Arend van Spriel wrote:
> On Wed, 4 Nov 2026 16:16:20 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
>> brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
>> the interface is up and not promiscuous. On the Apple firmware for the
>> BCM4364, ndoe makes IPv6 downloads collapse.
> 
> [...]
> 
>> ---
>>  .../net/wireless/broadcom/brcm80211/brcmfmac/core.c    | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
> 
>> @@ -103,6 +104,15 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
>>  		return;
>>  	}
>>
>> +	/* With ND offload on while awake, the Apple firmware for the BCM4364
>> +	 * makes IPv6 downloads drop to low rates. macOS runs ARP and ND
>> +	 * offload only in sleep, keep both off on this chip.
>> +	 */
>> +	if (enable && ifp->drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID) {
>> +		brcmf_dbg(TRACE, "Skip ARP/ND offload enable on BCM4364\n");
>> +		enable = false;
>> +	}
>> +
>>  	if (enable)
>>  		mode = BRCMF_ARP_OL_AGENT | BRCMF_ARP_OL_PEER_AUTO_REPLY;
>>  	else
> 
> A few comments:
> 
> 1) The measurements only implicate ndoe. Do you have data showing arpoe
> also needs to be off? Otherwise please limit this to ND offload.

Limiting this to ND offload works for my MacBook Pro 16,1. We have also got a bug report stating BCM4355 is also affected.> 
> 2) The commit message says this is an issue of the Apple firmware, but the
> check is on the chip ID only. The same chip IDs are also used with other
> firmware builds and boards (WCC/non-Apple), which would lose the feature
> needlessly. Please restrict the quirk to the affected platform, e.g. with
> the Apple board type (settings->board_type) or a per-firmware quirk, or
> move it to the vendor feat_attach callback instead of a chip check in
> this helper. The same applies to the other chip ID quirks of this batch
> (txbf and FWAUTH).
> 
> 3) This looks like a bug fix. Please add a Fixes: tag and Cc: stable (as
> Aditya suggested), and mark the target tree in the subject.
> 
> [...]
> 
> Regards,
> Arend

Arend and Andre, could you see if this works:

-->8--

From 4dce3bc04ce25711e03f8430283a87136726e46c Mon Sep 17 00:00:00 2001
From: Aditya Garg <aditya.garg@linux.dev>
Date: Wed, 18 Nov 2026 06:05:59 +0000
Subject: [PATCH] wifi: brcmfmac: keep ND offload off on the BCM4355 and
 BCM4364 while awake

brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
the interface is up and not promiscuous. On the Apple firmware for the
BCM4355 and BCM4364, ndoe makes IPv6 downloads collapse.
MacBookPro15,1 with BCM4364/3, IPv6 downloads topped out at 55 Mbit/s.
Same behaviour on the MacBookPro16,1 with the later chip revision and
MacBookAir8,1 with BCM4355. Also tested on BCM4377 and turned out this
chip is not affected.

macOS runs these offloads only in sleep. It enables them on suspend
and disables them on wake. Keep them off on the BCM4355 and BCM4364.

Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
Cc: stable@vger.kernel.org
---
 .../broadcom/brcm80211/brcmfmac/core.c         | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index 92ec269f43b2..d054d33f3456 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -13,6 +13,7 @@
 #include <net/addrconf.h>
 #include <net/ieee80211_radiotap.h>
 #include <net/ipv6.h>
+#include <brcm_hw_ids.h>
 #include <brcmu_utils.h>
 #include <brcmu_wifi.h>
 
@@ -97,6 +98,7 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
 {
 	s32 err;
 	u32 mode;
+	bool nd_enable = enable;
 
 	if (enable && brcmf_is_apmode_operating(ifp->drvr->wiphy)) {
 		brcmf_dbg(TRACE, "Skip ARP/ND offload enable when soft AP is running\n");
@@ -125,7 +127,21 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
 		}
 	}
 
-	err = brcmf_fil_iovar_int_set(ifp, "ndoe", enable);
+	/* With ND offload on while awake, the Apple firmware for the BCM4355
+	 * and BCM4364 makes IPv6 downloads drop to low rates. macOS runs ND
+	 * offload only in sleep, keep it off on this chip.
+	 */
+	if (nd_enable &&
+	    (ifp->drvr->bus_if->chip == BRCM_CC_4355_CHIP_ID ||
+	     ifp->drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID) &&
+	    ifp->drvr->settings->board_type &&
+	    !strncmp(ifp->drvr->settings->board_type, "apple,", 6)) {
+		brcmf_dbg(TRACE, "Skip ND offload enable on BCM%x, board_type=%s\n",
+			  ifp->drvr->bus_if->chip, ifp->drvr->settings->board_type);
+		nd_enable = false;
+	}
+
+	err = brcmf_fil_iovar_int_set(ifp, "ndoe", nd_enable);
 	if (err) {
 		brcmf_dbg(TRACE, "failed to configure (%d) ND offload err = %d\n",
 			  enable, err);
-- 
2.56.0


-->8--

Andre needs to sign this off and add his authorship if this is submitted btw.
