Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477091;
	b=VjwNeYNkAaSIVOnDCKYsRWgkF9J6gmSmxFFlUJJrcZykh4+v5j882yxvcMYRuotzayeJ
	 N7JgMuvAKDeigPQOcFuIy6gtYcB7e5nGEYlzQNdLhHWdTCcRe3sYWf90pfoWqhulZtCNe
	 ohTxB7TRzcJjKp0Q/91XTP0UsREpL6rLbP0K47yLy/DTCexglZwoazgIC9+Q3Z/8SonL7
	 R9CDReVoOmoTKo3GjFoNzqFv6CYNtcEUDANezRIhf0nvJHZQXCJPCHQGBv9pzL3oYvfIz
	 1Fozq6Hs3c2HWx3B+0MJcezrfCk2mJeWafZjck4fLsxWRW7bo7xgeJuLyMms5Dj4zlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477091;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=M3MtwKOuFl+dVkPkClM84aCSsGawhbDUmnS+lMhewPQ=;
	b=HFZ8wef6XUzyqZ2u3n1KYn6NoTvpT1J774oB5r7TTZGOp6faHgGa2QMM774i0sULpwGr
	 XMzkGH+yRZK9dBh6/2yg+jx5tO1sR9G1UIVbW/JtwGemrxOSdMNBwATl46aFiR7s4I/5q
	 hO1M7BnPFKGnwdcOPaKNLDfnYBN0N/M/q/xzR6kmfhiRVSVNEEAAMqH2U93i+bxYkMCfv
	 Wqw+jz7zKo76BZRqfkjs9i6QEu7/EdoiLP4rzUR/TmfWQof3l+66r3f5pJQerEb/v8CdD
	 tW/vA/xIq95H/+XPoWVCvWcEmEQmKZA7xZCDdpiFtWadNH36FLx87DLtuy1Y6N1JYtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V+tCuVhR;
	arc=none smtp.remote-ip=95.215.58.193
Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF43606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 23:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF43606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V+tCuVhR
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M3MtwKOuFl+dVkPkClM84aCSsGawhbDUmnS+lMhewPQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795477088; v=1; x=1796081888;
 b=V+tCuVhRkK36JSDiJhj096DwOKeAPFfpVSTBAfAjziHF8MvyomP5IOYxzhhmUGqaqfjwez7O
 AQwr4vyKqWtMt4LHOXX66WlFvS9sr6lrjEJ4haDoweKx+ABe81Ip8IvNnUxBuXpyMkHF5fyMoEw
 vwJ1Ry2sjkQfBpDNjMZcVJdE=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec0efb3956ba0c06;
	Mon, 23 Nov 2026 23:38:06 +0000
X-Mizu-Trace-ID: ec0efb3956ba0c06
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 00:38:04 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Zong-Zhe Yang <kevin_yang@realtek.com>,
 Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_2/4=5D_wifi=3A_rtw88=3A_repo?=
 =?US-ASCII?Q?rt_the_frames_purged_from_the_TX_report_queue?=
In-Reply-To: <20261121191528.591334-3-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com> <20261121191528.591334-3-mehmet.fide@gmail.com>
Message-ID: <16DD9A9C-4388-447E-8E36-8F65DDDEFE51@linux.dev>
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

On November 21, 2026 8:15:26 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>Frames waiting for a TX report of the firmware are freed with
>skb_queue_purge() when the report times out and in rtw_core_deinit().
>mac80211 gets no TX status for them, and the frames it keeps for the
>TX status of user space stay pending until ieee80211_free_hw() warns.
>On an RTL8822CE, after a firmware crash and an unbind:
>
>rtw88_8822ce 0000:01:00.0: failed to get tx report from firmware
>[...]
>Have pending ack frames!
>WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [mac80211], CPU#1: sh/24725
>Call trace:
> ieee80211_free_ack_frame+0x4c/0x70 [mac80211] (P)
> idr_for_each+0x6c/0xf4
> ieee80211_free_hw+0x30/0x8c [mac80211]
> rtw_pci_remove+0xd8/0xf0 [rtw88_pci]
>
>Free them with ieee80211_purge_tx_queue() instead, which reports them
>as dropped. Clear the TX status of a frame when it is queued, as
>rtw_tx_report_handle() does, so that a purged frame does not report
>its leftover TX control data as status flags and link ID.
>
>Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---
>

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
