Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026940;
	b=fmGGQTJSvgfRrW0iw969hfzhhtzleHJ8RuGSONs7fniY7ylSHtM1zJQGGm7H2v768jwY
	 wKPXz97IeRfNi9UsOeRl1gHfZBi+AOKeX300jDxjgZYP8RgPBFPnkYvCtgcjFrvp2idTH
	 onEY8yUkAEuovu4RDnS22pzqYR3ZwgD/2HLrWFRcpps3PWZhwxLEiciX8Y/HD8FIMZslr
	 Onx7NwQqxO3CuHGYjeV2k8mZkGfcLHBqRc4zix56Hu4zdW6ifFHRGXMdOIbhkR1KrEtst
	 ZN+xcjkwgZdod1wb0NffiR4p0i/DgcO08o1qjf9wgW57PVWVJJjOQbCmr09zKPijGJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L5wbkUZYtMNXPJXdaccMgVd27DQ+KICM3eePhOc5nqU=;
	b=Smp4izWrrW7bu+VWERTAiUioIuw/yLPplhnsflHV9ZyDMMWCUdr0LSNlf9yK0VykKhR6
	 i21B/dH4WfiB8OPRRbeZWjJehnBDHApiYarke6qN7YjWK8FLgP8CXQqhIseKA40ATXdj+
	 HQ4twkdb/RpmRKUmXVC9YBmgJqH9r6OwNFf7BV6esq1Paa1qnMdhg6Hp0bCLXa96+0LNC
	 Dl5YJF0FKCrCIJQgxID1adEKphvL00mcLik+3OvChJycRvAtSyzy1I6fac0gUcuRyGmjU
	 VJuCqfFJZj+jh8HlWR9wZINeB5nI+kHvLkNX9rUGTKe1MAd5i+sJUD2idSpgg33S73Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owPzAo5C;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B31F606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B31F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owPzAo5C
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372bdb942dbso1806273eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026939; x=1795631739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5wbkUZYtMNXPJXdaccMgVd27DQ+KICM3eePhOc5nqU=;
        b=owPzAo5Cg0da6pCBa733ICnomz11iMfsff7eGNc8Eisr8s6IdYXTrGUM3bfW+dZ4lM
         UqXDChlXfUlvUtAf62HTR+6ncUKr/qBFoBYP0nkdHXjXjEZMbZlVfT5+T9AcRrODbjG9
         EoUNb9yqsDIFLHJTFByntpYJ8xTknG+QjnU3Z1L2NW+9ROpqVKZ5J9RKiF/ypswAO3u3
         rgb9641P84uBfjfbHb0ZQ9wsaFY/qNo8gUq4taChL/Gd5lUae9LylZeL7IorzcvEkrhH
         ZSIdOMqn624WMxXwxlkSGvAi5WHzVkY6Ks8Q+q7xMRcWsUxDd+nX5CarADj2HMOHpxVM
         eNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026939; x=1795631739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5wbkUZYtMNXPJXdaccMgVd27DQ+KICM3eePhOc5nqU=;
        b=hbR2HzRSqxvnNxOYadcM7XpCc1I08LZm0s/gcavksbwytlyU7ewo8yLfHGswQd/L5a
         N0DClUSPQ76Zx8twpSwGpcR8SRnB088OshegTjqv/27FZIf7EVau9EZIj41ETyYLt3Nw
         cmKFCIg4NJDTVpBFyVMkibVIdIShRxhZFP2jfp8B17in8AQfnQoWORisXZ0xtkbUXqIz
         Syqmc/3i/CdrImjCNtHyFDFt/Bxv1dMVlKdLgNhjYWJiBZiHv+rqPEjNsPk38aGzKiSW
         +OgZ8fb38+C/227AL54GIsxdhHtWazLl9m41vUNjDSZ0fkXPrCBvlSGLPvVPA6Sr6O/z
         V5pQ==
X-Forwarded-Encrypted: i=1; AL+hErEAQ1NnytyTYZjsaeqTtaXGlMUwsqNUB8TWnB9CVnl+xU4+n1NvhJnfIdJKS1+cAJkJwqJmLH/fX6+5hYp0vw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/iv919G0zwHzhl/XbcDS1Qb/1X6BZJXI1IiZQdEL3bg8yJL8EM
	oj0a1TdfCdhOMyuCnpwFunbtQhOO98WX1PTrD7zMoTrcE6RoF5BLdB6Z
X-Gm-Gg: AYBFou2XPwNYqswklAA/TrLUQUIfr9FDbH13tQbfqvNzUPCDInMhLnNeFjYQZdtxJRV
	59dRWF1RiJWnuKfTWGLAVP0HBiRMfMhS4QMsvKBSrQbg3Ju73K0spm1DxwzaMWLcxcAqwYnDHMo
	9CrgSJkJzL4cxTlOXdFu6EBy475trUDFTinFIRSeOBakCiyIqpS5Z060Fn8aw2C8NunAyadl5Tb
	3hUDKXZ/M6H9nFmql6pdI37Y9Ei2AlTaC7CI6Pd0nP1ZnvlOIlKMOfUKLpbsdyRQCC66vAPlqiR
	qzdt6yUJHshJ2oiBuLXAOlTMq80bwe2hrjyryIQfJGraT/R7r1BKILzvRqB369rN4iO/TfnGoNx
	f+6ncQ4u/jpPuY7hXGg9RTOdkvKhmcRXFTfd6pqxAB/+VmOnrCE0CKtKG4lADi00gzYu15cQ+1Q
	MxqepwFW5k2YQw7m3opY6pUUgqgFBNa4ufaB38JptiPgni1dJLcwghfsAympJPL90+PbMRqvK8c
	LvT7QRrjay3Oj+OPYxaTOCs1liI0KR0rz6CpyGom+FtEagb1egCwTmCVXWKRjD9rVEynGOA5K8s
	aOpyt6Cbnotbi9GQ8IDdkoWfrBANDnKEpHV8vZmMwJ9vNL0FCg==
X-Received: by 2002:a05:7301:d816:10b0:380:fd90:e660 with SMTP id 5a478bee46e88-382815240efmr3105334eec.14.1795026938437;
        Wed, 18 Nov 2026 10:35:38 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:37 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless v2 1/4] wifi: nxpwifi: cancel channel switch work on teardown
Date: Thu, 19 Nov 2026 02:35:03 +0800
Message-ID: <20261118183506.45749-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118183506.45749-1-enderaoelyther@gmail.com>
References: <20261118183506.45749-1-enderaoelyther@gmail.com>
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

Stopping an AP while channel-switch work is pending leaves the delayed
work armed, and the callback later runs on an AP that is gone, or on
freed driver state after removal.

Cancel the work when the AP stops, and clear uap_stop_tx, which a
pending switch with block_tx has set. Interface deletion, type changes
and driver removal all stop a running AP first.

Found by code review. Compile-tested with W=1.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index ba54078b082c..5b8fb37c3f3d 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -1639,6 +1639,8 @@ static int nxpwifi_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *dev,
 	struct nxpwifi_private *priv = nxpwifi_netdev_get_priv(dev);
 	int ret;
 
+	wiphy_delayed_work_cancel(wiphy, &priv->dfs_chan_sw_work);
+	priv->uap_stop_tx = false;
 	nxpwifi_abort_cac(priv);
 
 	if (nxpwifi_del_mgmt_ies(priv))
-- 
2.56.1

