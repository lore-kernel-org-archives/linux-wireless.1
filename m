Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872123;
	b=ieAWsFqOtFN8tC7B4h77yZ4WBE23oTxO4PmslcR/NrNQJ6CizFE9EgIH+5yglu6z4zR/
	 nInSO26u9b9d0jZ5TSBf10pLcEUmV6Rlg4171xPHksWd/tgrZUO+HkTF59k5i1pRddC2x
	 u7MADUmSr0IYb+pl3ZJE27nJ9ys0kfPmvNfBy3l1XWD3/jDcALPoybpND2VAQtyC/c8hS
	 6MK/uPwPRQV7c1QETdq3ubxoWcXNh59Qoni4rTYrC2x6yMb6/0TLnrfSfZslJ8G38J7KV
	 kVtIpb3LLaH5G93lYgGwp3YO9Wgg4V3VszWDySR/YjEIjglnxkrdzQaAuZhYQ2yDy2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872123;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TIsNG9OO133XEXdDiYdaFsFjxWF8UJTk5xzajQneH7A=;
	b=gYxXDnHIsT/EsdHV84mMEKZl+fL0nmDI3tsaR0wLWMMMzrVtdEXHTDIuZxum2ybMTkCw
	 9ODfVAt1JQatUPmHwjqzBERQpXFEZ3Ycjr3JUJHfV4OUykIPEVBiaHigNaeo1BGY/xW5y
	 JYhG4mrtxfXAYbR1iPeciteP6F51mLw109Utq8pt3BbWOlU8VdhV7R/5NdTcOFtftbqpL
	 0rg8FvYKaiHNM6mgGItFfX+oNYjKpinzeYWbCfwN3jssh+HYKgMAFVfCoM9APdGF2dlU+
	 yYBN0WhgpUeCu1kPaIr16zEQc6uY7kve1Kjc50aC9Ik3krxPVAQJHB9GuP1PYz/Mv2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZWLsA5AA;
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85403606A32C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 13:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85403606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZWLsA5AA
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PUiqBKQ9Li6OSgDoww4zBGIeshAUKL+IEO4alP8ewXI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795872120; v=1; x=1796476920;
 b=ZWLsA5AAaf2yDjrnYQ4pLTHKzwc//uT5wSJTVImnsuWYFiK3qOSEQJewRl/LAPlQHCuwkLfO
 E7CQ4m12nn8kPaVt2x010maoPiP1OYflEOpGxX7Sr6loYKIDGH9+AqbWRijyUZmPLa3JnTY/Ufl
 pOwtBltdpDhxc0MEb7agWtcY=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b74baa911e8f359f;
	Sat, 28 Nov 2026 13:22:00 +0000
X-Mizu-Trace-ID: b74baa911e8f359f
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 14:21:58 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: niko3x@proton.me,
 Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>
CC: linux-wireless@vger.kernel.org, Ahmet Zeren <niko3x@proton.me>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_wireless-next?=
 =?US-ASCII?Q?=5D_wifi=3A_mac80211=3A_don=27t_m?=
 =?US-ASCII?Q?ark_NO=5FACK_frames_as_failed_in_TX_status_radiotap?=
In-Reply-To: <20261127-b4-mac80211-noack-v1-1-c7e6f7c56d3c@proton.me>
References: <20261127-b4-mac80211-noack-v1-1-c7e6f7c56d3c@proton.me>
Message-ID: <414C2697-5365-49ED-A766-98BEBEE37E76@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Ahmet,

Thanks for picking this up. One comment below.

On November 27, 2026 9:53:25 PM GMT+03:00, Ahmet Zeren
<niko3x@proton.me> wrote:

[ ... ]

> diff --git a/net/mac80211/status.c b/net/mac80211/status.c
> index 5d1807ab46e..48db461d8da 100644
> --- a/net/mac80211/status.c
> +++ b/net/mac80211/status.c
> @@ -315,7 +315,8 @@ ieee80211_add_tx_radiotap_header(struct ieee80211_local *local,
>
>       /* IEEE80211_RADIOTAP_TX_FLAGS */
>       txflags = 0;
> -     if (!(info->flags & IEEE80211_TX_STAT_ACK) &&
> +     if (!(info->flags & (IEEE80211_TX_STAT_ACK |
> +                          IEEE80211_TX_STAT_NOACK_TRANSMITTED)) &&
>           !is_multicast_ether_addr(hdr->addr1))
>               txflags |= IEEE80211_RADIOTAP_F_TX_FAIL;

It looks like rtw89 sets IEEE80211_TX_STAT_NOACK_TRANSMITTED for
NO_ACK frames even on RTW89_TX_MACID_DROP.

For a unicast frame the monitor currently shows TX_FAIL because the
ACK bit is clear. With this change it would look like the frame went
out even though rtw89 reported a drop.

Enver's v2 stops setting the bit for those drops in both paths, so we
should probably wait for it to get merged before merging this patch.
https://lore.kernel.org/r/20261127101307.15-1-owner@ph4ntom-rev.uz/

Either way the change looks good to me.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
