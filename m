Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875669;
	b=Kk1Rk5T0M12OH0DK14BXEHuLWMYXg9yl7/LhN4vYguCfkV2oWQJjBObwkpmR4jLaKomr
	 C2Pt/gQjmCCX3/xmH5OFRoXHLL4Pk1NmMUVe3kctckPLuRYTl8s3f137CxD2cwEZ9cGmC
	 AWuTgqAttfq/menUSQyN5Kv9C4A1tkFW/cy7W7gyyB50Nxv0qnRNTAkV3tmH2Ro8iJRZX
	 SDuzg/y0NhiuyXedMp0dwov/Bvzr9LAOQiJM9Du4O+qviV0bCC+hFfGibHWtlkPTJnmiE
	 5OAarsK1NX9XdoM8gHYM/M9Fv8MtV4niilfykBncvyekTvfct1dy5ganz7mXNzAIu7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875669;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zOWSa27u3Ave0V9vTT3pFsTcgdu8IRVtcAyDkVZ91z8=;
	b=Z/+0fCQRRr0dihfPtXWxmExUVSz44JV9pW9su6d0AIjLNoQDgTOUKHgQ6SwdxmfgIfT+
	 NLKYeDxWKCFrJnQ/ZnchBAmwCEka8bXgqW+A7lkx7o+CaK+952vckG1SMXTBlMrCfGOWP
	 5MdYAppCBRes18i7LUjRiwbBJ0nXRt4DhCv2O9ASz7uPV+S58A06wExVKR9ujpNQSdnbG
	 S4kV4l3kWNCAZdTBMHopmBWbSZW9CrmCIWgVDNj17blL8BxceczL1ZqngEvq6Derz+nhn
	 aVc9dY9GG0MHouuJpg3md7/8LatMZR0H40mmSvw/W8976BvNyZSMP4gQNpFq73BvLFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Ot4oqxy3;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F0D606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 00:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Ot4oqxy3
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yvvOOXaMMgB1nSlfT2xaMn+eYtcmhlEfU9FHzAzuR3E=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794875665; v=1; x=1795480465;
 b=Ot4oqxy3U3AK6oPbJVVqi5gnOh/xIuw6x23rbLp5RjGURpfcmIEw0c7hlJVYaUquOv1+61fe
 prX8S1gnX+IKlM06brMGbFcVhRnOx/JELdEBxTFsRw/LeJM53AnxBM8ddwQJSxBUQuwNYNgWSHp
 FsJ8o6eWiljsMFBNrz50c2vAY+nE7cxmuCy4y6XXga+Zfh2Mh5KzFYLLl2xbMZeGXSfgsjlEvoG
 27jKQ4KWrBUjRfK9rvAx9A0ersSCrrtBMeEqFgeyhkZzCFVkd35hcOnfv+hwIhBmLSCFAwGOIGA
 JW70B1Rv8SIzu0uy1io2hNbq5Wl4HXont6tpwVaGIImNg==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eece0ddd6e15d8e7;
	Tue, 17 Nov 2026 00:34:25 +0000
X-Mizu-Trace-ID: eece0ddd6e15d8e7
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Ilan Peer <ilan.peer@intel.com>,
	Martin Moosbauer <martinmoosbauer@vivaldi.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: cfg80211: keep the user's setting when another hint times out
Date: Mon, 16 Nov 2026 17:34:16 -0700
Message-ID: <20261117003416.22375-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Connecting to an AP that advertises a country regulatory.db doesn't
have, like the "EU" some Vodafone routers send, makes cfg80211 ask
CRDA. Nothing answers, and the timeout restores the world domain and
forgets the country the user set.

Forgetting it made sense when only user requests had a timeout. Do it
only when the request that went unanswered came from the user.

Fixes: eeca9fce1d71 ("cfg80211: Schedule timeout for all CRDA calls")
Reported-by: Martin Moosbauer <martinmoosbauer@vivaldi.net>
Link: https://lore.kernel.org/linux-wireless/8db36875c56cd9703dee42c7a00b81c9@vivaldi.net/
Cc: stable@vger.kernel.org
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Connecting to an AP whose beacons carry Country "EU", with a user
country set:

  kernel                       card          without          with
  7.4-rc1, wireless/main       MT7612, USB   world, US lost   back <1 s
  7.3.4 (Fedora)               MT7927, PCIe  world, CA lost   back <1 s
  6.18.63 (Arch)               MT7612, USB   world, US lost   back <1 s
  6.18.52 (Arch)               MT7925, USB   world, US lost   back <1 s
  6.12 6.6 6.1 5.15 5.10 Arch  MT7612, USB   world, US lost   back <1 s

On stock, a 5 GHz AP running at the time is shut down a minute later.
With the change it stays up, and a transfer running across the reset
keeps its rate. A CA element still applies, and the user's own
unanswered request still resets everything. With no regulatory.db at
all, CRDA is asked as often as before.

This replaces [1], which tied the two lookups together. Below 7.4 the
timeout takes the RTNL instead, and that version is what ran on 7.3
and older above.

[1] https://lore.kernel.org/all/20261116060723.37130-1-lucid_duck@justthetip.ca/

 net/wireless/reg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 5cd3880ee384..1dde03ce16a5 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -526,10 +526,14 @@ static DECLARE_DELAYED_WORK(crda_timeout, crda_timeout_work);
 
 static void crda_timeout_work(struct work_struct *work)
 {
+	struct regulatory_request *lr;
+
 	pr_debug("Timeout while waiting for CRDA to reply, restoring regulatory settings\n");
 	mutex_lock(&cfg80211_mutex);
 	reg_crda_timeouts++;
-	restore_regulatory_settings(true, false);
+	lr = get_last_request();
+	restore_regulatory_settings(lr->initiator == NL80211_REGDOM_SET_BY_USER,
+				    false);
 	mutex_unlock(&cfg80211_mutex);
 }
 

base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
-- 
2.56.1

