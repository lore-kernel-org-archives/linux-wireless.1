Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477102;
	b=QsejaxuBj7+279QsoBJXu/zmswRwl8x/L9P8SfHW+/dU7VuRcuKs8Ss0dvDZQqDw/wJv
	 IY99Eg4slgNR6Vt4yX7JfUXvEiioOJGKz0zlGwEoc9g+PEEJo+JZVgvbh2b/QOwASF26f
	 6oXDYUUVh88wW1rwDXur5Zyp0eVJtkK1E6J/d1e3GZgZMtcs/unC1ORpvAxFIlsyEDmEl
	 Av1YfC7vpqQLZya7D+JO+NIoS/QE4icwYLyHLND4cCi3aaN0VlvxZLavpa/0NK6GhxmOE
	 vhiiFXIgmogHOse7R2oQsrjYoAzCqZD5bTbQ6mG5r7ZGIaUB96IgDaGSlYzkQY21L0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477102;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KCnwmkEmE9KD+1uFCSdTtPwWMIkmIPWrLfClVd8l0gw=;
	b=SmLipDBNF1tu+om8Ax8xzRYT6x0+Q81qDlm0Q3pqf5MGcm9LSRuWenesudWDn8eN7dkx
	 8iLJuLxM7OBC5Wg/0GZkjLk8OPmviG04W6si+rfjGP4G7+lC1ixtWmdF0UwHJMzApm8t7
	 DKW8UhHW4uyHdUx3TUWD3LXvzFWtwXyjUq035jKy0Nm1OP8BAhfscEt7+hk6x9kuPniYC
	 I2Z6zab4XOry/7ww1d1BaIQt7Z9N31EizaHbM4vbz6xQB+H74KigepzDm+P2u7l29enzQ
	 nhy5NDwidrCVBXNwyRvPEhMR8n1quOZWqnWRu2YebwDZlpKIGDvS2DJDP75nccEoRkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h+vOahla;
	arc=none smtp.remote-ip=95.215.58.197
Received: from mta1.migadu.com (out-197.mta1.migadu.com [95.215.58.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17405606A321
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 23:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17405606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h+vOahla
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KCnwmkEmE9KD+1uFCSdTtPwWMIkmIPWrLfClVd8l0gw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795477099; v=1; x=1796081899;
 b=h+vOahlaZkMdgpDYidUpIwjsHicWag3Mewva9AX2VKl3C49BKp3E42cQBeG3vS+OrLTus249
 iUYwbI/3FVve7whjU5mP/0X+AP6/pcMl7GneqlQqtgO1LTuu344+NGkTV2P0HE2uHuIlKpA7g5t
 ZvBBvpFSVjmD6pxxtFfkGHkY=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3cd6d033670d05d8;
	Mon, 23 Nov 2026 23:38:19 +0000
X-Mizu-Trace-ID: 3cd6d033670d05d8
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 00:38:18 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Zong-Zhe Yang <kevin_yang@realtek.com>,
 Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_3/4=5D_wifi=3A_rtw88=3A_do_not_d?=
 =?US-ASCII?Q?rop_stations_when_collecting_them_for_an_iteration?=
In-Reply-To: <20261121191528.591334-4-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com> <20261121191528.591334-4-mehmet.fide@gmail.com>
Message-ID: <96E13482-9087-4201-9CDA-B86A2DCE2CA8@linux.dev>
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

On November 21, 2026 8:15:27 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>rtw_iterate_stas() allocates an entry with GFP_ATOMIC for each station
>it collects, and skips the station when that fails. Once the firmware
>recovery resets the stations through it (next patch), a skipped station
>keeps its TX queues on rtwdev->txqs, and rtw_txq_init() later
>reinitializes a list node that is still linked.
>
>Link the stations through a list node in struct rtw_sta_info instead.
>All callers hold rtwdev->mutex and no iterator collects again, so one
>node per station is enough.
>
>Skip stations without si->vif. A station moved back from ASSOC to AUTH
>has gone through rtw_sta_remove() but is still found by the atomic
>iterator, and mac80211 can free it without calling the driver before
>the iterator runs.
>
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev/
>Fixes: 78d5bf925f30 ("wifi: rtw88: iterate over vif/sta list non-atomically")
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---
>

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
