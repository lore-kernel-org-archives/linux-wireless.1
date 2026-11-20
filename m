Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180239;
	b=Fx2+XY3NjWQfXWDQmQS3dt8rDpFb34OyQnzjVf6YGtAKnWeltuXiW3cEarHBhQ17T5PJ
	 TX9ouOvhzoDKAjpqiUw7T0IfOb5v3KodV6hHPlfKM7vCvfFiyXd+WOp8bSZCDyR4+qptC
	 RBS+rBj8mE0lqR3E3ho/Z+OeW6bMGZzjznvEnR3GbB7npo8mLM7DwNRVkecSgj3y1u777
	 Wp7/+m3xBLOW1oE0+xHOccYMVNXfo2D3UmLkm8kanSCnjidvnRs2I4nvPFmAScqupRLkI
	 UvPqK//KC4AIf+fjFqoHUDm8cvHKufGzA/VrBWMXg1ZzVhxyccPThTLV80IG2pIVB/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180239;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=10xBO6BM5jC2VmfBalPyz94xHQa83JqJS3DZ37b5vUc=;
	b=CoY7SmBVDUe3s48EsO6dpYBX1hh7qlXrG2l5ZKFmA7Yp1uAYxCSeV6sDpjwxpPpqaKoX
	 NZCVBMVtxNmQqWlzR3MHmq+mez1SZSR0F/esyooDnt4Xod78L2jdasqG7ipGRscaT5jtg
	 Yn3ldE887ODhxQkHV1KL9IOpIAOs2vwp6VH/3yiKBJGGsNJDePx8IZU+9bKCLJS91IL1K
	 k+gfr/m66uP/NKQ537svTfZ/qNc0KFFzgSNLNtxMOMNrlWt5v7AU0N+5qNGYuFIeCXJC8
	 0hkZ8yPcG1Y4Wtv3bIvm5oe0gRaTs8n8yZQo+0JfYLrfbIAUPZ1pTguAAZAGpJelvMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LBgYHFor;
	arc=none smtp.remote-ip=91.218.175.161
Received: from mta0.migadu.com (out-161.mta0.migadu.com [91.218.175.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954A60A260A
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 13:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0954A60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LBgYHFor
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gv0BXU35raU044WaCVsEvA9rHw/hM7oxsFEnRZDuxAc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795180237; v=1; x=1795785037;
 b=LBgYHForlr+filyEb04K+4N/Uu6PbzoR5S1nuUFYFRJMFe7J8uIMBrlNagZ46Bc1rG0Lo8sX
 oxkTTLi6s9BSLBTprkzHfwfjhMQWfI90F6wDGpT16adoGMJuZAexia69WectS2HE6aB6fBKxhcY
 R4zM5l4XeMIESmGj+A8L6vzA=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06dd85436cc8512a;
	Fri, 20 Nov 2026 13:10:31 +0000
X-Mizu-Trace-ID: 06dd85436cc8512a
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 3/5] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Fri, 20 Nov 2026 14:09:18 +0100
Message-ID: <20261120131000.33858-3-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117171003.1840491-4-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com> <20261117171003.1840491-4-mehmet.fide@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

Hi Mehmet,

Thanks for taking care of the allocation failure. One comment below.

On November 17, 2026 6:10:01 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

>  static void rtw_collect_sta_iter(void *data, struct ieee80211_sta *sta)
>  {
>  	struct rtw_iter_stas_data *iter_stas = data;
> -	struct rtw_stas_entry *stas_entry;
> +	struct rtw_sta_info *si = (struct rtw_sta_info *)sta->drv_priv;
>
> -	stas_entry = kmalloc_obj(*stas_entry, GFP_ATOMIC);
> -	if (!stas_entry)
> -		return;
> -
> -	stas_entry->sta = sta;
> -	list_add_tail(&stas_entry->list, &iter_stas->list);
> +	list_add_tail(&si->iter_list, &iter_stas->list);
>  }

Does the driver mutex still pin a client that has already gone back
from ASSOC to AUTH? In AP mode mac80211 can do that when userspace
clears ASSOCIATED. drv_sta_state() calls rtw_ops_sta_remove() then, but
leaves sta->uploaded set, so the watchdog can still collect the client.

If userspace deletes that client after the collection drops RCU,
mac80211 can free it without calling rtw_ops_sta_remove() again. The
temporary list now has a node in the freed station. list_del_init()
can write to that node before the callback runs. The old code already
kept the station pointer too long, and this adds the list operations
on it.

Could we skip stations with no si->vif while collecting them? As far as
I can see, rtw_sta_remove() clears it under the same mutex.

Best regards,
Luka Gejak
