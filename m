Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354950;
	b=HBOl146CTzwBOLM+KL5mrXcweuWJ1LWsLiPqyqms3ceBtxk/WdeFXlbA4GXUI9+OfSdz
	 xg5ZnY1rnjtuorSU/+PbAlidYhBD+AYbbppP4OTlTnUg6o9C72ZruQLpwl9FwBqy8VA1q
	 gC8NZJXqMsN2O+CdIEqcr79kC47fAdODTlo3xHrXm8pRSuTCVQCWj0DhNquyGLAQ4esHZ
	 SoB3qtrF6vLkwHYU4SOJgTpwJlewHIvw2hR9fiJfx/BzoHaYdkRWSlLUNrw6B448DzgR9
	 /z7DYqCY7eZDkZjyEyZxbuR4YjIrKflyQhwxeXmsoE+eKDTtCCLq6Id0lN0kVciwR9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
	b=YtQg+qMI3sYyKpgDwDtM5zi1uczg3zwZRpfSSzJGPopyS8XRDE5p8LTHsOAGEmBp7Vrj
	 vjONE3qYo6hxT7brp0zj/r6JpTdrjOssL8mnAsgWuDkeGefoGRUYk0viekRh2allUKPcW
	 DGlw7lRf3jdLqlnDN4jQUtQ4fmoBsjGUBS6Jyo5DktOhY7LLKzkdUeBVDkORmyXWhpjHg
	 iANqai6eh0AHTHh0H0N5IGC/doGIebmjaly8Ag6XhRQfghTfV8OqxhbrvWzP8NAoX26Ya
	 n1ga8gX8cE5zo7Tq4c2RbqfO0u5E4umEVnkhXi2x4A9zfCx/5NkoOUQMl0RhJTdI7hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i0OqwT1R;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B4606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5B4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i0OqwT1R
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so330285566b.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 05:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354947; x=1795959747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
        b=i0OqwT1R6zYF2OL3SBIIAuFU+nCBkGYR3qh45rJl6KbcfUll0eHwJdHv1yOsLgVYi+
         Dt3xywdYmXGyVqHJF4zwX/bu0HJ3KsYpoXSKNN78OXdrP86wwzp0m5ZbBQ8LvW2oYFJm
         qJRnyK6SWSq3BUc6yb0vaY0VfaMQtF66GtQRAPWlubfpanDjdJGdjHXBojD9flhV5sap
         dkFM62xeGnEpzoGZGrHDWaP+Dcbf7DqrjaRbx6i8yAcXvOuPgg53MPWjzVapHlhJVDre
         wk2g9yXHq1XTD8WzhPcApvFrILHzLqkYRjF2+tcSc/ndwFssZ3eqben/o6LGcAY6mZ1Q
         OBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354947; x=1795959747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
        b=F2vj8bzO25S0gJlWnwDhALxujL0jL72j9Loee23Eh3ehXVJId6ySgtxITXXSe8wUN7
         T01RQjKogF6OobXxtEAon7KaZ0WfJIawFFlTbrW+fm8+MQtTRrjHKZpsN9irbAs20ny7
         7f3MtkGso79EmEJBpCNYGrH+Tgm4clqiVko3E3T5rJ2/DjstOuLheBQ+2Z/FDyv5LFM+
         dreTBPUiTLM83ZX69O4Mf+jwDUd4Sbcu1WvQDEUzMhR0IxTI7PwKgK5JLdP/3Q61ICha
         FGCEz4hhdYaE1XbVnzXe++K137M3D75GrfKEqzxstTytpcYdzk23kC1B3s6HWSZM4nwl
         L22g==
X-Gm-Message-State: APuU4Z9Xa3SyddUiirTleAXBIPf/nlYU6SL6wn5xuiLlYUfkA4lIG7RC
	hWw20Sshuq3TScso43BinVAJDkw1756f7mrlQuBAexDuQv62DMbFLqGrKGulcisWqw==
X-Gm-Gg: AZFdTZeSRLlUAcGJOGgXtFbd4fG3GslzmImrwYQMOqIuh1lNCDLlIm6hJmhI9qcb4yw
	3ioyr94axUnsoE6r5TGxmZksFaqW6FtaQtysPoKrC3ip6P+BFcAdDj5tX4JjjvRJzOFGgikDHzy
	TVD8+eSg9UWIUTcC3WNVhR5IPOKLbgFGRSbP5PvwuwPtAUQPO1qVLE+vTy+jf33YD7/cZiSPrFe
	1iy04BhCNx70E5VXqUBabM8/MX7LAqL2GZywt6ofcEaxsk1l14XuAPlERhYwkQD7UsBNPAzhvEG
	v/Ozg6hIoebwlpvHhr/RpPAXvg+9Z4Xh63Hq36swef+4F+ANAm0whgCs2ul6mawQI6usbBj1W7k
	mzapNAMySb/r3vsVhGt+tR5JyVY+1djJu0l6mnTHsaElNktc6EmrCUi15J4YeewZmAC/D3Cj5KY
	EHIko1Uq0I1XLU0zZOtjEtHNFfLYzbZ4wtNlKWmnNdTav++gh44RsFs0lv4H9BiqV0evcQHlg1g
	eVxGerWwFDTCEhYo/ElN9LCYeHcassDkDC+f0H+j4IdXj+4KqeIoo6B14zP6CLkHnJIj8INaxrA
	JoJhIoBhuVyNhOelysmUdhR9HihnF+ED8DTlarBKRSOrSaTVF76El6yIKyei+Eo7vD+mu4PqCPr
	KD651S7V9zTFtbKG8klL5GQxGO63ey0s9HNvyLaGCm59GMYcgkjcXOsSIgKxvRTzE4ZrlxMMI4a
	A6PROnGSzg+vNt8Em86362M/ALQzJ517ZpKd6Wg1VnYIpsF7Vf+nw0kWdZ6pC8kX3avd3ie60OD
	V9HBIZb9F8cdf4ruGvfucSAXM5v2i05UdY7nEK2YMct6mLRlTByMsJgPTeY3CLSfrWm1/kzgu4/
	xc0cfuNlpRi7ML8Fhzbkqxu5vL1852AQ/tN1tckPUSD/CaHXDI7Pewo=
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c513aabb216mr555094366b.40.1795354947374;
        Sun, 22 Nov 2026 05:42:27 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:26 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/4] wifi: mac80211: TSO and SG for encap offload, and the TID of 802.3 RX frames
Date: Sun, 22 Nov 2026 14:42:24 +0100
Message-ID: <20261122134228.956044-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

Patch 1 lets a driver offer TSO and scatter-gather on the netdevs that
send with 802.3 encap offload, without offering them on the 802.11
path. ath11k uses it on IPQ8074 in a series for ath-next that lets the
TCL segment TCP batches, which depends on this patch.

Patches 2 to 4 count frames received in 802.3 format on their TID: the
802.3 receive path counted all of them on TID 0. Patch 2 adds the field,
3 and 4 fill it in ath11k and ath12k.

Patches 1 to 3 ran on a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.12-01460) as part of OpenWrt's 6.18 kernel with wireless
backports 7.2, as an AP with Ethernet encap and decap.

I used Claude (Anthropic) to help write these patches.
I have reviewed the commit messages and the cover letter myself and
edited them where needed.

Julius Bairaktaris (4):
  wifi: mac80211: advertise TSO and SG for encap offloaded frames
  wifi: mac80211: take the TID of an 802.3 frame from the driver
  wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
  wifi: ath12k: pass the TID of a received 802.3 frame to mac80211

 drivers/net/wireless/ath/ath11k/dp_rx.c |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  1 +
 include/net/mac80211.h                  | 19 +++++++++
 net/mac80211/iface.c                    | 14 +++++++
 net/mac80211/main.c                     |  3 +-
 net/mac80211/rx.c                       |  3 ++
 net/mac80211/tx.c                       | 53 ++++++++++++++++++++++++-
 7 files changed, 91 insertions(+), 3 deletions(-)


base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0

