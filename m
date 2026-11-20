Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157872;
	b=JhU9lyS40MpRq8sWYahHtb1C+fhSO2gpaW+mcr+0bSdLQYuNN/W380wjOLIw1tmOHVNi
	 9Uv9vFSHbyFqHWH3fx3CpO6ZcB7rmo5z7Bp7cTM1HqRIfxJME/g1eLLAllb2MEhFt5GzL
	 piSxESOVqCrirxohsnSz8qyV9Bd/fZ2WnyynaLj1DkIkNO35+hnUVeguhYKfJ8iClWuus
	 Zwp8WozYCdNSiyPR46VPMf6623LWX14ysdDPdrlBW9hVqYvQ88SEmzFkn5JpFfwzi7EhA
	 0GrTi9TUbIIsy0F0Ycb1uG2XEwDlkuEn2inPiaUXShyxdXbLdH6PjOWE/RxALF89EXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157872;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vZjFpfz4MT2X5iNvRBWjE2aF1ANIw7Nj7MOizwY18Mg=;
	b=H/ggN6utO2GR2GxtJkE1MRgkODeKVg9ezCBBMxgDzbyDje3jsA45QoT9btBhPnrodoD+
	 IWRXLxOoEcEhAIDcl7E5dBuqkyh8Xi6R2t/+SAPBKfAWoJGHQR3OUl4/ICXzzGUxDJKZw
	 6+IXFbWQe/jzAEqrIvB7OKIXPrVYcZSun3rs2Zf/RW9hUMBAKpdG51SfvNYWX9svM8nK2
	 dPlN9NlcMTaan1K0huj87TAWT3k4mQi/9haekUYbnEX6Rt0riGDNfl9+CkFhNNBzR4Qnk
	 PU2VbnL/ysFetpGoLZQR4UoDfK4rw3PyWH9nA1b53Kf0rQ++iGpvrGfApxKBxVZbzpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=GsO93gPb;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2675B60A2602;
	Fri, 20 Nov 2026 06:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2675B60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=GsO93gPb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=GsO93gPbSPfKMTHQq8hZGgKh5K/CGkLAkSCMo9U8uB2tSw6YjAbEtgiWKdlZKivPwNDwuEaAOGL3Y
	 6trizUucdWT9YVgzSDxhIRZt66NPnhdlT26NK7tolUJAk0kkSvAg5jpKLicSU1sIx1CZoY/IfVz2zr
	 AhlKbvqOWpPVQTUw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36affef17702-f16f8;
	Fri, 20 Nov 2026 14:56:23 +0800 (CST)
X-RM-TRANSID:2ee36affef17702-f16f8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.112.32.189])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86affef156a0-821dd;
	Fri, 20 Nov 2026 14:56:23 +0800 (CST)
X-RM-TRANSID:2ee86affef156a0-821dd
From: guohongyu <guohongyu@cmss.chinamobile.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com,
	arien.judge@morsemicro.com,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13057616121@163.com
Subject: [PATCH v2 2/2] wifi: mm81x: bound disabled-channel loop to the allocated response
Date: Fri, 20 Nov 2026 14:49:05 +0800
Message-ID: <20261120064905.192045-2-guohongyu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>
References: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
 <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>
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

mm81x_mac_check_fw_disabled_chans() allocates a response buffer sized
for ARRAY_SIZE(mors_s1ghz_channels) (26) channel entries plus the
fixed header, but then iterates the entries with the firmware-provided
count alone:

	for (i = 0; i < le32_to_cpu(resp->n_channels); i++) {
		struct host_cmd_disabled_channel_entry *entry =
			&resp->channels[i];

n_channels is a __le32 filled by the firmware response and is not
validated against the buffer size in any way.  A firmware that reports
more than 26 channels makes the loop read past the end of the
kzalloc()ed buffer into adjacent heap memory and interpret it as
channel entries.

Bound the loop to the number of entries the buffer was actually
allocated for.

Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
Signed-off-by: guohongyu <guohongyu@cmss.chinamobile.com>
---
Changes in v2:
- Drop the Cc: stable tag. No code change.

 drivers/net/wireless/morsemicro/mm81x/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/morsemicro/mm81x/mac.c b/drivers/net/wireless/morsemicro/mm81x/mac.c
index 0fa80b1488aa..953958bf1241 100644
--- a/drivers/net/wireless/morsemicro/mm81x/mac.c
+++ b/drivers/net/wireless/morsemicro/mm81x/mac.c
@@ -288,7 +288,8 @@ static void mm81x_mac_check_fw_disabled_chans(struct ieee80211_hw *hw)
 		ch->flags &= ~IEEE80211_CHAN_S1G_NO_PRIMARY;
 	}
 
-	for (i = 0; i < le32_to_cpu(resp->n_channels); i++) {
+	for (i = 0; i < le32_to_cpu(resp->n_channels) &&
+		   i < ARRAY_SIZE(mors_s1ghz_channels); i++) {
 		struct ieee80211_channel *ch;
 		struct host_cmd_disabled_channel_entry *entry =
 			&resp->channels[i];
-- 
2.43.0



