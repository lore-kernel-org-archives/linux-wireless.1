Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126373;
	b=CLvYrkYi4pAImG0GGZ/zzS5e16rTiisCJDmG/HAWIk2gluqR/2OqDgacrLkdGL1+11NY
	 9GWw4kaR7j/2tDoUvBhkepSYZ/fUW4rdjfOttXCXbNfGs5oqSDIEBoJSiHjYEnFE3r70Z
	 MSiyv830zQKdoRH87B31JTiPwMVXS3c26jAOu6Mh88LUh6SHamJ/s/I4ibhWEftiV6ORd
	 UlRbpPld1lotMTgAZrOVwjW+lH2+Dr4xgLhbzvNiIBZhlvG/+MzfeASTQrFYsjwqDSiiE
	 UOFcUHRWBk5wpmUI4R5ya4N+5U6goz98Tm2nSQSo3cnY5iRfrwtEy55qRX5pWHhswEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126373;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Vw0dPpL0fw679SYGsTtznmOXrs8qoAl2KeijjLyVh2U=;
	b=GgbdNVD4ZHQ0QNITf5v0U2sFQMqJiA/5xe3cqAx3LVReAgLpsuIoGRggqZTC5bUZLZmR
	 XybAQgiry9KDQtLnJ3FSwx83P2oOBeAOMzX7SawAihAZ5bwCSmnJikFNSF9GXlTudfVul
	 1JgpPiUh3tZwVViyFkyc2cuPeiLSuJpXUtzYwgksfswshvugl76OsebINGEnGim5O310/
	 538teSezZUEPAnr7xtHpqI4sMLTidbJBmtB5y9fbKOlkkzJgmAA+ikwcvEpOZ6Xket8tP
	 o4a98YAIoaUxIQzPTfZioAiYO64IIihj1TOqSeonZ7tHAeabh7oZH3E27ti+P0e7u6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUptE4MP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27538606A33E;
	Thu, 19 Nov 2026 22:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUptE4MP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126372;
	b=RFV4T4CLGOgpGWMubFeP0n3Hbs19BHAyTeUq5mLHCjIlrFUWRRWsjtmaMOTSbDfLKEvR
	 AwXm+I9eIabYxa2UerXOq4as5tus5aIYHaqanujrDkx8eKaPHvXSae9VkkqtJWh44x11X
	 vDJ7kcYYHvxJnVZT2bZ24pU2YpHJN1LKQ9Qa5yz8ZmhazA6LnCahlcoPqWeOzzjbykI7i
	 COlcC/W2w3tY2RDV+noFNPx6I4m3TEyQe90pgXjQtW/nsdkGh8SIenGwwS1AzPi873muI
	 9wNYB18sC7ILoCjTmtG4B9Q2f4yV9GKCp1jzNF6V61WAn4PoNAbx0NHU1RwojhraWiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126372;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Vw0dPpL0fw679SYGsTtznmOXrs8qoAl2KeijjLyVh2U=;
	b=2RdLgNj1MzYvqCyPpS4GScEfOV/OXTgLjklPPrgQKIJFu+/Z3A4OVjzIR40PjK4+ycz+
	 XchbuuQ/Xq0DAoL91PnBEONiTj8hMX5bFXIeHNDDXjZCw3G6UCX+w7+HnITiCD4DtZCtO
	 dRVDotzOJsUJwL6xDMKvQJUxI6hy4r9Du6G1HbwA6OREDf6vC3CIDJeN0cQ7xnyI9Foy5
	 Deqlp2s2ya4YzeCqjJtAetPSefFYOhNCclGj1Ka55QSC/5XBFrPGqNMhjYh6JEMJn27gT
	 rhkyvGJQwozIBLX6Nz5qRsHKc4SS7N6mtdutiK2QIP9+7+j7Boc/wUdVkHY8hYtPsqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FC121F000C0;
	Thu, 19 Nov 2026 22:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126372;
	bh=Vw0dPpL0fw679SYGsTtznmOXrs8qoAl2KeijjLyVh2U=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=GUptE4MPHaXGJM/6nn489t756FJD/tqWNOxmyUPb1tufiNNWoVp2uj3xmMC2qYK6c
	 hWwny0Do77W2gcUYQt8EUttsKtXX2zljGMGpReMn8cWZ/de57BNysXKBdHMd+80UFj
	 KA9jBTK9qm8QQXnCazij6XrhEIZUt/yQoR7221HN6ETEivlAQswHWYdiT57HbI8P5a
	 3VO8uCHTkXCi/c6CTx3kCVGGXASkmpWiPxTI2LBJ11kPPLZA8mbkyErDt2TAUWBonM
	 Julc6o5zK9hHQAiYEkdM3/VnG718AD61PSWmcVu57Z0ioEyFz8ZEDssF86Nw2sxnZ1
	 yFV00zXLfVYCQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D1E2441B18;
	Thu, 19 Nov 2026 22:12:51 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Subject: [PATCH rtw-next 0/2] wifi: rtl8xxxu: report real TX status on
 RTL8188CU/RTL8192CU
Date: Fri, 20 Nov 2026 01:12:44 +0300
Message-Id: <20261120-b4-tx-status-v1-0-abdab21c77fe@proton.me>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQAwAvyI5N+AGUexXpIdVY5setrKJuiD+3
 dUeh2FmB+UorPAsdoi8isovZHCPAoaPD29GGTMDlVQ7RyX2FVpCNW+L4jhVDRG3ddN6yMkceZJ
 07zqItmHgZPD6G136Lw923eA4TlNriPR6AAAA
X-Change-ID: 20261120-b4-tx-status-df4722e9679a
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126366; l=2295;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=dhmD0zEeKlt6Ioj3kwSa/s223Wn1BvOadJNjregLYJE=;
 b=As6aklSKEMYj4fWzqI7IwN3azINEWhqHcTC0j0DnWM8PuhFrWjw0zO95cwrNMNPAdw6dRfR9U
 I5LcErYazzlCVBCYkdSHw7oKxBn3Xop/+YUWpamFV2PQ7/gEZV/NEWz
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me

rtl8xxxu reports every frame as acked as soon as its USB transfer
completes, so mac80211 and userspace never learn that a frame was lost.

Patch 1 stops reporting frames sent with IEEE80211_TX_CTL_NO_ACK as
acked.

Patch 2 uses the CCX TX report of the RTL8188CU/RTL8192CU firmware to
report the real ACK status and retry count. These chips post C2H events
in the REG_C2HEVT_MSG_NORMAL mailbox, which has to be polled, and the
report does not identify the frame, so only one frame at a time requests
a report. Other frames are reported as before. The vendor driver uses
the same report (C2H_CCX_TX_RPT, struct txrpt_ccx_8192c); the firmware
in linux-firmware (v88.2) sends it.

Gen2 chips and the RTL8188EU have their own report formats and are not
covered here.

Testing on RTL8192CU (0bda:8178), by injecting unicast frames and reading
the TX status mac80211 hands back to a monitor interface: frames to a
present station are reported acked, with the retries that happened;
frames to an absent station are reported failed with the hardware's
retry count, including when the retries take seconds; frames sent right
after are not confused with an earlier report. Interface down/up and
module removal with a report pending were also tested. checkpatch --strict,
W=1 and sparse are clean for each patch.

AI tool use (Documentation/process/generated-content.rst): the patches
were written with help from Claude Code (Claude Opus 5.5). It was asked
to research how these chips report TX status (vendor driver, rtlwifi,
rtw88), confirm the report format on the hardware, write the patches
and run the tests above. I have reviewed and tested the changes and take
responsibility for them.

---
Ahmet Zeren (2):
      wifi: rtl8xxxu: don't report frames sent without ACK as acked
      wifi: rtl8xxxu: report real TX status on RTL8188CU/RTL8192CU

 drivers/net/wireless/realtek/rtl8xxxu/8192c.c    |   1 +
 drivers/net/wireless/realtek/rtl8xxxu/core.c     | 128 ++++++++++++++++++++++-
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h |  17 +++
 3 files changed, 144 insertions(+), 2 deletions(-)
---
base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
change-id: 20261120-b4-tx-status-df4722e9679a

Best regards,
--  
Ahmet Zeren <niko3x@proton.me>


