Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770870;
	b=OBcMBD6nY8D2yz6gKcpLmyvBASb1XYdz7oobQ1wbtzu9fcRcySrPwQcuIYZ0iaJyE3XO
	 7z5pWku+epFuoIGaAJZDTuE32DPTBEPif9NRCa5Qn/5MbL4JLrs8zCg3+GsfJqoIo0UWq
	 fFqPOpTMhEq8YaGXVkHlCMtGj2Pr88kfKBzqrp4o0FP2XQXGP1xsoPuzwJscOby3irn/K
	 VxgmZbtwbYMBDK3Mr2LZsTdAnbgdX62uHrtIGVnCJlIxTrhnbKmfpuFc9a7mamCh7Tko/
	 ayvGZS7bn36cKnTx6CAAfbln0gvaAwvGzsWc9j/O64NfB3HH0zsUuCwvnutwTtKbPww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=;
	b=GhwGcP/3+OTER095UjHPC7iSAOB1QTVqTSdK/3J7O39RAjEHBSrsz1CdIGmIIp9qlonI
	 CkxMgT5TNIlixfDuAo964byvy14KJqreIYF/fETxTGFKlzpFojFbFNVaTieCFA4KRyZyL
	 p2jXEoJsom5e91VX+1M/PLy/plzbBKXVXt97iOiHP1bknKHj6HWVZxJL2Z0KlKXbrzzF4
	 2M0avLqmb42ZsG6wzkc0JgofaT/Eb/OuxGVjChbH0Fn4ff83uU6BYdHlIbeutxTsY668s
	 IT/79PpEIF1qFwBQYrCSIKoIzHwoQC5MkWBQ2lukhA5dsfmAwGP2ji/Drfw/Xe22Lbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIzoKe6Q;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B585606A329
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 19:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B585606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIzoKe6Q
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2977313a91.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 11:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794770869; x=1795375669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=;
        b=OIzoKe6QdCSPp0UTuPTRvk4jU2866oxArlCSwkQQ0rk53rt2m2h0Rnqyy6YiLEHn+i
         ITZXLfC2DUrD8/MZDW9gyQwYK9x1dzUzk9WxLCeGT5D6ItOCerMzTnkYl36CC8lZp3z/
         QW62V0XxpvRoN1GS0TkHQdDiCAYZ6Ts2thQFPvzO+6cL5HQ0E+Ga3CyS4PrSR+FzAFvj
         1tyEMYDbhKQ1TaM+PkV6c4kJtexkl5GKhq/Ex0ycn04KMaBIgs5oZmq+u6+pZOn8hrc/
         UO5alnT7IIqm7KPzUDKWF/63k5tGaQxQWWm//y+HaT6LoyxQSYAvv8vWd4/ciz4IOOza
         HNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794770869; x=1795375669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zK1HFeXb+5RIaaTyR8jNDy335l1vYAJOKc4AYeqRcfQ=;
        b=OcmnP2r/P2StMcxEItLRDIXGaGWsOqHe7rtkwxzp6CJCTOQP/a4SIyZzvRh/nS1Grg
         6pdh4V4eSHEH2DM4d3bEFye5Xsg44oLxudsvZqCAfNAr6axAF17esQVOH4+cceIjuoWu
         0x2RFdm+jgkkJQaSU+B+SP03z07WNE1zaSHALF+dsgUSWDZDWcgLuLhR2JV/IV0BQFAC
         Z2denckLaPXxxwM4KFl+m/TPTudgOazOGUczX1x45MS7ZrclQ7nyD9wSttvM+VE8a6Cp
         ke1o8BFtXwR4nE+/K75eSYSrij4V88FNWcDaYNIds/HrcS3/cuCwgMcuogHNcctiMHW0
         7xGg==
X-Forwarded-Encrypted: i=1; AL+hErH6W7AKLClOJmWIrL+4JVRaFsC71UmqFMjNPH9cmZQZ6SPn/y1w+3OPCNqzVW+xQF2j5OsSOwqP+Z9plqdrig==@vger.kernel.org
X-Gm-Message-State: APuU4Z9wAhNhDmjssrt4c0Ip8OLu5sb66c9Uv8kbFNJAj7kjx1UMf1rV
	8MnJ5gw0oaTw/n5zidRQqvqsSbBO/kbyqonofZPUt4zxMSJ6towWGFOZ
X-Gm-Gg: AYBFou1a8bhO/+OE66KByHH21fVdjijhuMT0x3YBehXUMaYAtgV7Tqgr1jmAYZvJhkf
	KzFA7HcIqajaK+C5NYpePiQv5viAgReOoSmptUZlafEWIuxy5ZlgThq6ojLxTijOJXbt5CJZH8h
	nHECDJX/jH7Nr7e7a8Il5kLUbPNGPs11WCStTJcLqpWDeg79wsMkgibaHBOcxkCSGIKxKCiNR1Q
	9S216z+15byGuyKJFFsCriMIlKYKPBIGmiMua5UOSgEpOParQCIA8sdRy8StUlTUBaFalabQmCM
	eq89ZqoA1Lc/AxQ51z2vnXR+tPaKxHJxOLUCoYNYBsXIzASBpxZ7WMJ6fKn7Hw2DySDzsGtdfsL
	O4/qsa61wnWHkoTR/HGQiokZK3l875bJeA6e2OeP7gsP7zaANZuSncnf7GK9PNav47DseUCKpWl
	ovGvnn307sUemntUIu/jaUly2/wUNjyrDgzV019wQPlS8E9ADqZionPv8tkX1xbK8khznmCTlC6
	7PZ+DDaspMk3ZQZ1+MPpxMWT+CWMlKNgIeg890VjPIYgzdHzzn/g6G/m8wOB01iOn9XkznLdcg7
	FiJYSFDx9KCwUIX7ierVUX3CR65aMmEKwyJCv+rAAxrDtEI72jIg2uwvrU/D
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr8453054a91.17.1794770869377;
        Sun, 15 Nov 2026 11:27:49 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b4cca7sm5633895a91.2.2026.11.15.11.27.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:27:49 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
Date: Mon, 16 Nov 2026 03:27:25 +0800
Message-ID: <20261115192725.8230-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115080239.910402-1-zihengw03@163.com>
References: <20261115080239.910402-1-zihengw03@163.com>
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

Hi Ziheng,

On Sun, Nov 15, 2026 at 04:02:39PM +0800, Ziheng Wei wrote:
> -	struct mt792x_sta *msta = (struct mt792x_sta *)status->wcid;
> +	struct mt792x_link_sta *mlink = (struct mt792x_link_sta *)status->wcid;
> +	struct mt792x_sta *msta = mlink ? mlink->sta : NULL;

The MLO part is right, but the cast still needs a guard, and the
MT_RXD3_NORMAL_U2M check below does not provide one: it selects the
unguarded path. mt7925_mac_fill_rx() computes unicast from the same
rxd3 comparison, so every frame that gets past that check arrived
through the one branch of mt792x_rx_get_wcid() that returns the WTBL
entry as it found it:

	wcid = mt76_wcid_ptr(dev, idx);
	if (unicast || !wcid)
		return wcid;

	if (!wcid->sta)
		return NULL;

Not every entry is a station link. mt792x_init_wcid() reserves index 0
for beacons and management frames and installs dev->mt76.global_wcid
there, a bare struct mt76_wcid inside struct mt76_dev, immediately
followed by the wcid[] table. For that entry, mlink->sta reads at the
offset mt792x_link_sta keeps its back pointer at, which lands in that
table, and msta->vif then dereferences whatever it found, so the header
is still built from a type-confused object. I can't say whether the
hardware reports index 0 for a header-translated unicast fragment, but
the non-unicast path in the same helper already guards its container_of()
with wcid->sta.

Doing the same here keeps the conversion valid for every entry, with
mlink and msta left uninitialized in the declarations:

	if (!status->wcid || !status->wcid->sta)
		return -EINVAL;

	mlink = container_of(status->wcid, struct mt792x_link_sta, wcid);
	msta = mlink->sta;
	if (!msta || !msta->vif)
		return -EINVAL;

> +	link_conf = rcu_dereference(vif->link_conf[mlink->wcid.link_id]);
> +	if (!sta || !link_conf)
> +		return -EINVAL;

With status->wcid->sta checked above, wcid_to_sta() cannot return NULL
here, so only !link_conf needs to be tested. The per-link BSSID lookup
matches what a3ea1c309bf3 did for mt7996.

Thanks,
Zhao
