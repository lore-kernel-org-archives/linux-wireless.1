Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025111;
	b=AjEQMrJl+wP5EiZdgWA3Pd2ddJoXQ00V7M3QqqqOQ0MphKS2pAoPL/IVra47M1ZIMDIb
	 wG036af+8vhUO9NAJ4cYUWvPzTi26kI1g/0V+wHEjskczboar+bj3DhrqiwFO7KZLaAr2
	 LAdLuoVG5A8NjzBL0jS2ulYMe3HFA2HS4qELzHAQUcmhjeVfCOLlLO3sxqhYthOAUWq2E
	 u7vegV3N4DWUW7bjFDSLgMVOcjVftcm9ByWwQosizJkPYjEN9zANzPYYcw5qZDIgKfoX0
	 Cik8/+tNyncaSovL0r57icsheIA+CbfYEICURkI+c2DKu6h0Q/FHVygagYISP1n6Eiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025111;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=VbhavZ6ya0lhbQ6KFedIWVlMpZ+gKGv/IqcKLAaKCsM=;
	b=tODq5bakiogYGXH190kYeAa3sIcjDanPB98dywTe9r6nlRiZ3P7cxcQxQo22rBohyG/c
	 Xerr9bBksRaAGMxMPzKPRpOTO9YCzfFhcrWIxOboZ0UdE/zWrOk82Tpypt1aO1f1u7WFn
	 W93jTwmoFbACWBQRqGVvockgQ77rjmJOSHJst22yrFUfIUFLOZrKVW2HX6/+cYpQI3J+G
	 j+8JSXcDeLdfx+jqhG6Euwch8pyc+rvEfdMQbFlO9UY+scIopvEmWyHPsAG6/q7kgCzvb
	 D+kUEcZagJIRS6gtTtCyK6XeRgN/8NuREeSL0fMtsyklWP4tmS1w1vJpT52TIugTJtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=nogriRmK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683F606A325;
	Wed, 18 Nov 2026 18:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5683F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=nogriRmK
ARC-Seal: i=1; a=rsa-sha256; t=1795025080; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UADL+Q/fhE6k4fFScn2F3l9x8srIM9gc7RNkuntrTHpbxHAdcbDQBPUyovvHmybK3YlgLGOG0lbjZ7apvp7BOWTBsB38LOFZBeV3wL1QXM1dNaRpyG6NDy42QVvQ7RD4Wd9Mz7R37/45bMQnQX61Dqx9w25Wj4ybf77fLxj0K5g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795025080; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VbhavZ6ya0lhbQ6KFedIWVlMpZ+gKGv/IqcKLAaKCsM=; 
	b=SqknkZqa2TIYLZpbfrUgqSAszMmgPYThIWwe3/z9JaGsytxqw3l4/SYTFvCbnuYwgyvQEcs+F8Nb8vCeOa2G6796pu4pFarpTdzDQI1PRY3cvxKBnkJVGZaOOLUHPEca6uzNU5MM0VdaOKG9MWC419r47nlBCaMUfHbei36PZ2w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=nogriRmKcfCW3+lcwQ5i+N62Eg0OnEgYQx/CXWvOGxu1EIzESrizd6c9cBA7OFTtvm67BT05cPzp13WD4fcGxlEm2ISoFRrZOcJh733O423kOGdP7YpQ/Swc7uARd+osj4csUWNdtT6BqXz5Evh/33etfG7+abKtLXmg8cz+s2VOndcbvtRK4kTq81lRkcEFpD6zc1dBd3mNQFWquCXDtNqPczERUc+qCYvbioHN99wqEEoFKILwo0tB54W4i8LuGrMa14YpRL6afM1nn3XAEo1NVy1uIWY5LyGPIE2I7UmmtlYYdlkVxCFsQuk9lP0zLbV30JtAltd5FJLfqlGlOA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=VbhavZ6ya0lhbQ6KFedIWVlMpZ+gKGv/IqcKLAaKCsM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795025079103791.9502455280252;
	Wed, 18 Nov 2026 10:04:39 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v7 0/5] wifi: rtw89: monitor mode and raw frame injection fixes
Date: Wed, 18 Nov 2026 23:04:30 +0500
Message-ID: <20261118180435.904-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
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
X-ZohoMailClient: External

This series fixes a NULL vif dereference and a negative radiotap rate
index bug on the TX path, restores the operating channel after monitor
down/up on non-chanctx devices, and fixes control-frame seq_ctrl reads,
sequence preservation, NO_ACK, and retry limits for raw 802.11 frame
injection.

Tested on RTL8852AE (10ec:8852, firmware 0.13.36.2) across 2.4 GHz and
5 GHz.

Changes in v7:
- Patch 3: drop the local no_chanctx variable and check
  IEEE80211_CONF_MONITOR in rtw89_ops_config() so the channel flag is
  not set for non-monitor first interfaces in ieee80211_hw_conf_init().
- Rebase onto latest rtw-next.

Changes in v6:
- Focus the series strictly on the standalone monitor interface case
  (plus the concurrent NULL-vif crash guard in patch 1), dropping former
  patches 3, 4, 5, 6, and 8.
- Shorten commit messages and rebase onto rtw-next.
- Patch 1: use vif_to_rtwvif_safe().
- Patch 2: clamp negative rate indices to 0 with max_t().
- Patch 3 (was 10): move before injection changes, add
  rtwdev->support_chanctx, and reuse IEEE80211_CONF_CHANGE_CHANNEL in
  rtw89_ops_config().
- Patch 4 (was 7): keep control frames on the AC queue and only set
  seq = 0 for control frames.
- Patch 5 (was 9): simplify ASSIGN_SEQ handling and drop dead code.

Changes in v5:
- Split the NULL vif fix and negative rate index fix out as standalone
  patches 1-2 with Fixes: and Cc: stable tags.
- Split monitor injection into focused patches.
- Honor ASSIGN_SEQ, retries, and NO_ACK for injected frames.
- Restore channel on leaving idle for non-chanctx devices.

Changes in v3:
- Split into a patch series and use driver abstractions instead of
  direct register writes.

v6: https://lore.kernel.org/linux-wireless/20261117094135.1772-1-owner@ph4ntom-rev.uz/
v5: https://lore.kernel.org/linux-wireless/20261113235211.1911-1-owner@ph4ntom-rev.uz/
v3: https://lore.kernel.org/linux-wireless/20261104203051.564-1-owner@ph4ntom-rev.uz/
v2: https://lore.kernel.org/linux-wireless/179371849554.20972.16232816164394690660@ph4ntom-rev.uz/
v1 (RFC): https://lore.kernel.org/linux-wireless/1a196d6dfbc.35537d221913104450.3720060455831933789@zoho.com/

Enver Ikromov (5):
  wifi: rtw89: avoid NULL vif dereference in rtw89_ops_tx()
  wifi: rtw89: handle negative rate index for injected frames
  wifi: rtw89: restore channel when leaving idle on non-chanctx devices
  wifi: rtw89: avoid reading seq_ctrl on control frames
  wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames

 drivers/net/wireless/realtek/rtw89/core.c     | 27 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw89/core.h     |  3 +++
 drivers/net/wireless/realtek/rtw89/mac.h      |  2 ++
 drivers/net/wireless/realtek/rtw89/mac80211.c | 14 +++++++++-
 4 files changed, 42 insertions(+), 4 deletions(-)


base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.56.0.windows.4

