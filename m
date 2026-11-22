Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354953;
	b=R8WEQ9cTygY3ml+pacQfi+56clIArp/nt5IFXLXCo+vFmfbXGXWlkFn7HrW8eBPE+0DC
	 AFUA9YNdeUU/UdHWpVU/1pd5ngLtBLTWTtFyySnovL1zKDca73458RARD1h3UGVisDOzs
	 klluhnUXR15f4h5IfUydA0FrnQ6qhfC2RrhnvoSnlrkvQIKsjjmAsTKYFeQLp16IHZ+m8
	 AdgmHvjUml5EVLwy1TV9CLN5Aw1ktpquVusivw+/mDifGnnmjX3ovvM7vVkEGrnbogEU6
	 Fn1sPyyNxx4O91UMdh/7fyCeiFTEQFkvnKxirCMmT2M0NJST31EuJo0F6n8/46sg+aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
	b=MPDRH+jUu59wAKpWEeN/1qR0rtmRo5xqKZJzfQqREFre4p13QK/DApmZlNZRak0ptQYK
	 P/0SHcY9ijq4uxP7Fppz6Ct2FF3hPPzygiEGJo4/jurMTmY58HN1o564dl1MS9jxnZ5w9
	 rFMEE5hu13NrQ13hJMt5IVHsTOK0a6O0JqqKy0amsNEq8Z+BAywqPzVYcYV2XqhJ4549b
	 mvL4ondDA6abrnr1sEXsV08CUlhIAEcLeCsI+G32TME0HglrKQ0iFOPY0vy9APQQWC63J
	 6l5O7ts0uV222a80ukl8SuI0IJTL5svEIhBsyttLgqF0K2Rc+Dd4EINNvFWeh5PEwHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XaTLOvXB;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970B7606A69C
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 970B7606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XaTLOvXB
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5126505cb3so311828266b.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354951; x=1795959751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
        b=XaTLOvXBtGe1GTurJwUECWEVzZUrBl0CK75/PLgq1My59TyDTSJegqOOcVtsLZyr6s
         MT76FLj81pxsfp1xp1oAdKCJjzg/AoFsqr/gQ8wdkIsAj7Tn0vNCwQ3KtPKDce2GnkZg
         s745hSJ7NUxbifOxzQX8NA59mjgKdFjb0rO6OQJibtpr0vFVr72J7QwVuXDkSDJb7llx
         MqDSlDldSwN+CPLi3nILDJeCtljKjomqq1XrnoiYT7aWZx6E8usrt61AfYFrkSASZp9q
         nbRB3FnWLtvE/WGqz/znJ0Dk2hT8P59sd0doQdMHo+ez+SysRVAyr79/0UIT+FSit1cw
         H5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354951; x=1795959751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
        b=uW4bqll3MD7mQHM6Vm/dqCOQYvJVYOaEkxH2vheh2bT6LqEmFvKk00TcUgwrOSj9YT
         y1G/GWwkAmXkjA9bgdNF682edfdNzMAPCzEJA5fE2FZ5EQDoUFbFeYqdirUcpKt/wRJn
         Qf7uqBpPZFiPIHLbwKGzPj7dPGCsM0WgenyB5xWyxIRftgyKSh++7T1au7UNybrlndbZ
         KsC4Ap+lHnDThMPS4aOJ5deC+L05vt+Nlk7oTABm4TcQRwtxO+XGO15/jc28fP9HoClK
         vqNR1dQVE3BDCt1EAKj3RIKuNrOENnXDIwNfaFqB4Hla3FbGdlyQGpepkR1Kscf7XWtQ
         V3jg==
X-Gm-Message-State: APuU4Z9ZwCpLM6wj5qGG149URMQjm5rhFQs17CGIJrwGH9/cl68bcLkA
	pbSRd2uuuUMfNqwAp+/Xsy/c45+1PkdZN5CJAk5fNyAnnFJFiABJjh9hZpbKLE2gnQ==
X-Gm-Gg: AZFdTZf2X3MhUlkDaK1I0ElcacaP5rPaGYRpCE/URhgOb4wWB+8e9ZH+ZNaoFcy0SQd
	z4LuJlUoJx3WvlZ54XYQqq/K1VAChiO+6QXd2V7klINHyPFFQgeEK1NsZBYE0rWyW/3de5nmqja
	DVM5eR+T3DbA4Sp94o2hj0jZp3/nwSfaca9auRWWfoiax/qFd3hGLOAIaVT2s7gIDLlOd6yl1F2
	+VfjqTGNdNyu6UeXeQB8ru/rE+3KR13XxujlwXg3FzQuiZuMhHpXEMfg0ClcLFnZ3eWs+08dSRf
	KLEtlnfxIMWx2w1Wb8b+UnlYg2TaWd0acmIRcyonh+ibJzV3ddOIhi1xDW1pFtzTY1hj6VXSv6V
	gn6n6at3rPRFQFa5meU3G1b7X/yqO3Sxr+w9rgoJjcd9Yg1VB/siOMhv/GOuyRZQopnc+5a4Noh
	/FamDE/0XidDd3BqwsC30RFaeywsXHsTNKZ+Pg6wACNYY/MXDUaXtpiixYxF1t4JLt3SOx54Kel
	ZSwfHySJZBFj3qUWkPFkpKYbce6fYwZGqyFBJNqWqbXeadmra6jU2Dr/r7LOMuO2KqpqCt1F6K7
	ivQzuw3Xxx/1VXyhSp9c99S03/xNBgfzJLPv3leG2CV2OzaUN4QWoQLbh7cTvx69ph++5Ga/bDR
	QlzgZdH/eRONpXaqzFN9yaYCCpKy8ws0eyvwplCUeP78AXKS4jVBn8nmwmm+/ZBoczvf9eT4zdl
	GN4P/AZKzeDFgvv/x7M0WJXQdlHNCsWdMzcfzhSdvQL/d4VrUzMlx9nkhkagDmOodO0AXcCNYcr
	fBsvaKpKpLks8y9lZZU2zLZad4JrhguJxW/dBpWjFFelk0eJJaRuaxe7hzpr4TKnKpeTdi/77P3
	BvIPhcLaJ1DGBjs5hNPOncjWjqo9Pr9zgRf2UUDT4Dwne4wg+vfl32A=
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr418956066b.16.1795354950990;
        Sun, 22 Nov 2026 05:42:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/4] wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
Date: Sun, 22 Nov 2026 14:42:27 +0100
Message-ID: <20261122134228.956044-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
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

ath11k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver already took from the REO or MPDU start descriptor into
rxcb->tid.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..7235399c5b39 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2493,6 +2493,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, rxcb->tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
-- 
2.53.0

