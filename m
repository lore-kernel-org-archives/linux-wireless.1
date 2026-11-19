Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795075415;
	b=gBifLfecfQZgzBcLnG0JkJzOKZWqqtLTbWYFw0ssJNMB/p6mIkNmxcWdT880OzcBXx+7
	 QLxWy7xN7i5GNFF6oCuviae4pchRlQwgRFjDRJNg5zSUm+YhmiUwQWHRzPuqPS+2Ohwz3
	 a7CiRK+khy2n6daWPQTjBdJmzodb6+KB6rFL5mZPvpe6XNtnD27GujtZRdCYk//n3vfzt
	 GdBRMgPS0rOkixxcoLrJd+q9f1mP342O609lZ465hc+3Vav0H932FTN05b6wl2Gu6EeT/
	 7dBYiz1AP5OY5mkuK3rhWX1fd6+vwAy0EAdpfjRiRCddgpHtcVGdwAE//HXlC+Uk4iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075415;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=clZp9RKdDWxGA2ytPk5WMlvWk8EVkiHR5DSfzurYOq4=;
	b=1tuRR1xoBkAPz7tpxaI5qx1HQCQDaHCx+ooJuYDZM3oF2jop5QfmLQH44pm4k7ewKSMx
	 aeSt8Rn4iBEcididriYxTTTUdho4LIRyU0Ln4CWcOf0qjAUpW0adDdmS5YPHY08uvcchm
	 ODMk9dz9rGcm+9gnRSjI2UQZL7QITmLrCaY75Ap5BFUptfDzKqsgDF3hYwI0QONxhrMD6
	 L6TckgqKZNWUIozNSDTUkUiveM6t1R9zyblUwgcCL+EW+/q3AIsE7gXixyLgEDvK57Jfl
	 yEWYueOvcUVLROIaA2uASRofyweF/2v6G1KQHU3EyLJh7Wn0kPQjo0E+HGsFFQbJEPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Sj2FlOvs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C6A606A324;
	Thu, 19 Nov 2026 08:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C6A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Sj2FlOvs
ARC-Seal: i=1; a=rsa-sha256; t=1795075414; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PUcMeFXIQi/rSqIX3EVXpN3+XYeAReKhU6HkZjWE2H96rBEDjxzAFsSUoWq6+zLTjTR58Jj5U0nH2TmSyCWQ69lBB9JcQRhjfW19P9faqiowGU4tbmdAhwbn0W0+8HoDla5pE4qxEh9iKnaEmiyIB+F8peh2bi5Qy+s7ELGa45E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795075414; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=clZp9RKdDWxGA2ytPk5WMlvWk8EVkiHR5DSfzurYOq4=; 
	b=MKEgnMdaOSrYfWmD//sVywVV+bzo3VaninFXx6hWoS0Mu1Ylu8wfH21R6L8hFirv1yNjjVV6Vr3iSPV9nzvWSln0h3OCfKP6Ug1pp7oIY1zu8pok1FW1ZMDZknaGLwSsugTT3cUdblP4waSQ+N5nGD33NI68EwvmMLx3rPuQO08=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=Sj2FlOvskVSQacF2LUlJq+UDtGPvqrPIgbCQg8WmScX3Qu9u26lzv5TqKVlitJHl/X2qiAFsJSFEcbuW83HcnIpBxjb5EaJkM/q3edMzoROTbVkEfTKOUM5euOtTPSw3of+Rpp+rlN6huE0XoV5KzGG8EKodqzSv5j4EFtxr3CLJ/3HqESTETam01/qES92Ysd7BA3iLc1A9Y6GcRxGYrbG1s000d/galx3SaPXVUWDYGUgHby34mobOzYIHCFIrDxmOYKg/8MYfnvv+HD/+3XpVGgWsKIzVNsRRFFn60WUkJfMm7hNcus0GC4PwpPh9XlsdICKmLRymZnDP6CWQ4Q==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=clZp9RKdDWxGA2ytPk5WMlvWk8EVkiHR5DSfzurYOq4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795075411912145.06853922299524;
	Thu, 19 Nov 2026 00:03:31 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v8 0/5] wifi: rtw89: monitor mode and raw frame injection fixes
Date: Thu, 19 Nov 2026 13:03:23 +0500
Message-ID: <20261119080328.391-1-owner@ph4ntom-rev.uz>
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

Changes in v8:
- Patch 1: update Fixes tag to e3ec7017f6a2 ("rtw89: add Realtek
  802.11ax driver").
- Patch 4: add a blank line after setting seq.
- Patch 5: note in the commit message that Wi-Fi 6 chips such as
  RTL8852AE lack a TX descriptor NO_ACK field, and unwrap
  rtw89_build_txwd_body6_v2().
- Collect Acked-by and Reviewed-by tags on patches 1-4.

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

v7: https://lore.kernel.org/linux-wireless/20261118180435.904-1-owner@ph4ntom-rev.uz/
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

