Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844555;
	b=tz8e9gRYgbVKpsTyfbBR8OgpzN3qg0AHPeYNmhX8Xbd4XZ1xu2WDgnuwogMsh76X6uEE
	 Xnvybvvh6NStCdE4lZdn12oCpJHD7eXTY0FAywOfBkGlOoSWGxagbMYiYApQo1fiEyjJD
	 e0hU0tDYI/eKhW7zTGG3noPv0NtbFJLcDIvr1g+agixGv0/NrMXVPoF9R6a+ejvVy9Z2U
	 WTNnWi6Y+OvEdN8RW3qrQlAC7v4+eq4KWro8tb0a8c6eQnzm9ghWtd25nxlR4ComTBuAW
	 woazwfwPU6S3Fd/MDMFgvExkU6qt15KDdeComcvCnERvqR/cQk5B7R1xRNXB3Vg0bPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844555;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JaRPI7EIL9yezobh8ZLq6nTg4HFAeHwBiZLMj4s8kHY=;
	b=bI8meJb3L3SCc5/a5iTV8JMHLWjlDuECDrx6BkP7QZxqLYidJlH/S8YsqwphzYqfJIGM
	 /qyK/CUkDqHixPGdatLKGKxcBuG2dnVnOkjj0Ly7blG8clXVvxCeK24o7/Lnk+/I1wy2X
	 eL53Wear6tOT1FH8mxgtEUnCmivctLPG8b1eVFhI3XHEhfPOi4M8sTkHCLJ5S4rW07aMP
	 tmv6BUT1XVhTjjWd65WFJ7f2ieG8OdiUzvI2dfL4aZsKXgzzncaImk1EWL8GGXylWSVko
	 Ff+zZbVcvgOhk+pbHj7AcOl6hx9ktyjHZJEtadT2bklglvCa4e/CrlcONxr41umT+7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BWhOJ6aU;
	arc=none smtp.remote-ip=91.218.175.155
Received: from mta0.migadu.com (out-155.mta0.migadu.com [91.218.175.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7A606A329
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C7A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BWhOJ6aU
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CR8iWGGqT0Nsw+4zbHtsqMFKXyzWdW2y4w0g16IaiaQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794844551; v=1; x=1795449351;
 b=BWhOJ6aU3E7hnxOXaxjxUJKu2elfzTKiuCNdvv9AGlps0osPo67opVzvWtOWZR+4Sr4+m3eY
 RBcCVSaQe49jbm1esGOglzSFMJv9Hd5oU4z8Z5h4qgjnlA+xiNDxKtX19pRYXqdD5PaCMo7N+Jy
 WPjVAdTlBpwHllgpXCLghY5c=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 062b17364c277a74;
	Mon, 16 Nov 2026 15:55:51 +0000
X-Mizu-Trace-ID: 062b17364c277a74
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 16:55:49 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Zong-Zhe Yang <kevin_yang@realtek.com>, Tzu-En Huang <tehuang@realtek.com>,
 Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v2_3/3=5D_wifi=3A_rtw88=3A_reset_?=
 =?US-ASCII?Q?the_stations_outside_of_RCU_on_firmware_recovery?=
In-Reply-To: <20261116072014.1142494-4-mehmet.fide@gmail.com>
References: <20261116072014.1142494-1-mehmet.fide@gmail.com> <20261116072014.1142494-4-mehmet.fide@gmail.com>
Message-ID: <4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev>
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

Hi Mehmet,

Thanks for the update. One comment below.

On November 16, 2026 8:20:14 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> @@ -664,7 +664,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
>       WARN(1, "firmware crash, start reset and recover\n");
>
>       rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
> -     rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
> +     rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
>       rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);

I followed the allocation failure case from v1 a bit further:
https://lore.kernel.org/r/699D1E7C-1793-44A7-AF57-CFE16AD036E6@linux.dev/

As far as I can see, skipping a station also skips rtw_txq_cleanup().
For a queue outside the voice access category, wake_tx_queue() queues
tx_work. If that work has not run yet, the omitted station's queue can
stay on rtwdev->txqs until reconfiguration. rtw_sta_add() then calls
rtw_txq_init(), which does this without unlinking it:

        INIT_LIST_HEAD(&rtwtxq->list);

The device list still points at that node, but the node now points to
itself. __rtw_tx_work() seems to keep visiting it while holding
txq_lock. Its list_del_init() cannot repair the device list because
the node has already lost its old links.

rtw_enter_ips() does not drain rtwdev->tx_wq, and the flush in
ieee80211_restart_work() is of mac80211's separate workqueue. So I think
this can hang the TX worker, beyond the station count and MAC ID leak
I mentioned before.

Could recovery use an iteration that cannot silently skip stations?

Best regards,
Luka Gejak
