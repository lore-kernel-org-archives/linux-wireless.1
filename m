Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026932;
	b=hMs2mV7J7mSc1jg5G6HbqRcYrnWa+XAJEpLjhcCW6qt7qha9oM8EkQW/pQODgstDQ05O
	 LaKAMr39aLhRAdGqF29MlFoM0Zy+MEbN4BgxoSTBtLvwlPRI/85bqjSwWO7CYuIr5XKIs
	 BMShLq+Dh/hTfOqBOdznYT9uZpcfYlZF3y9wdDPQ/X1GFPlDhQOCPm69EnlAcWbZyRNgN
	 CqbuhcmhpJ3NaLv9rfc76N4ubLBt1KedOKdF0If1LWRchQ1X1GyueKmCAAZuNCsHbi5C5
	 36iEY3qSZG7ewDFzR7FppIA3C4KNPpOglBVbD7Cq2jkIBUFS+Y4Lkc48AGwQCZUtZTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vurW6tbAJpm0OszY3dmHyuFaclayQrUJ/MbTeN4Jusc=;
	b=RbgH7JaevHoQlZelZ1/sYOasv6v9IjRlJJ7zXfcnL87W62qw1NvVFWP8dc1hr/zHG9Jz
	 VjMnYcZnJJmNswZZbG2lOPSizqOJzgFUbxgTkJqlGmCJXy8x5heu2YHviBFby6OzBsFVa
	 nGIZntfdUvygwySHBfQDNTV/lx2vdE/FPqcf0d0RvkQRQ+FZNaj65dRFP/zt6ueVJL60/
	 qYDP9q1UCyIZXG4H5t/q5J7/rBQv2MCDm6eswsbNgw9aNxU+pXNhdsGUoza5CNAASyBJs
	 gD/s99Kb2kYYCJ8109aqdwrtdqyut2NUYTdXCK2d1SeSrevfgYjJHijcwWU1/pdfR5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AVsqmuBk;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A8606A337
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596A8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AVsqmuBk
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so3705482eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026930; x=1795631730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vurW6tbAJpm0OszY3dmHyuFaclayQrUJ/MbTeN4Jusc=;
        b=AVsqmuBkIE+iASTOiLvKdYYsjK+y7ivJfFWXz2Q72VuJNkutNyDzOPFjOzdOlKDANC
         ruzX9z56cHG8gTqMEBNqspZE+KrNU/G5QF9ac82XSmAdBkoXBWgSTOYU/Kn50YtIonFf
         B/5BQVcuRzaW/q19DQM5wpMHcN59TL/mHh7TyUjzod1iorUhtcR6QOx7iSyKPKI0GUo/
         Rts3VRDpO/yteh/NnxXO4amwxMxenJD3oVw+yg8Cvx8oz7dMnxQIqcBDRCCgaoq+cVFe
         Yt+ftv4w24js7wrXMoAP2bz5sT+y9lVyTx32ZBUee6/Wbz++HN0JCqAprApytH3zWE+H
         g4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026930; x=1795631730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vurW6tbAJpm0OszY3dmHyuFaclayQrUJ/MbTeN4Jusc=;
        b=YeO66IgSUYsGkhDSJv4LnUzb83I/QLqlD2ndBI6RE4ktIa1cqZaA5FpBLBWQO2onje
         P4ZlAZjkaBxucFEkv661A8F8ZhHoem1S9uhon6+SI7uVxcPPntdBF1RH/Jl8sksZ/WQ0
         j7nRFiBhTW2g/fZtHsCT1F09uQ4g6SKIF+xttFRT6m4HXCCWWf14nSV+qEcnx/R3ziZw
         ccMTNCotj2uEK0tMTMbeLocJICVlARKwRgv1ABwqxVWIVOqGBWZoZM/qNwCxwLUe8pRi
         Rh8Jbq6VUMm47F0hGJT+JmZtJg2j/brnLGLILBFT6jJNc+nlWJO/sMDf3Bib+CTYPgQL
         Hpaw==
X-Forwarded-Encrypted: i=1; AL+hErEOHzr6myG229f2xuUoKfG5nnEVVD2mwv7dUZt6B26GSuEOfr2Blx9uQavNRAqU6SXctbU6OKtMF7M3OJfXZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/sT3v56LFLQajxWsNMUyfLvyG0vg48weh3EQGY9nB4YI0LXL7r
	8+xJsvkUPYtR5qim/+baljhOLDdb9tMHw7+DfmOkc20IkFXBSD8eh0Kx
X-Gm-Gg: AYBFou0xXiaczD37WZvSYmUJDeQG/canJYihrsizBcgJLQhJIZPqLaDLzrAOuF7qHC6
	wVEBkVMQWKHM2oideDgjT8ZNYiXFsOQKjf+Pu2idi7VhBVD0Nw4vjg8qgQltLUGl/lIAnxrCOvb
	qye8ZKF0h/+CAKfjeEDLR/bcVbR+z5rggJXhrSHDtBCtkey08uwa/MTHDcJ9/6up9kvMcuAG01Q
	UoLJlaN/TvBvS4+3ity1avXO+bDiGCPuM7zUqllSOeskcqjOGe3w6mZefEbN8Wta4FARlL/eJPE
	0TzbwRnYWV1gpxtaQyKGTW7D51ms0T7c44Odw4FfosOPAlTc+pPhwQUWReuKBbtaxbqPFhENpy8
	C6ynQNQl3WIGLtQoZLLn7u+/9gu2pbSvh6c9pliAONWWUaEcF6tXi77UkYfl1dmOsSVekGSkP9j
	OqGKwCSjJ+TY5FKfMAjiXV2y7U6Pw4DGbxR9gXtx6QERrdNElbo8m3XIU9JSirycsI/NXmu5G09
	AXKDtfL7b/2EqgwY7JyIODfnxDgEHcD21YxQ+Tmqk1fR7CPWm/aQpkNFiNBghwR4e1EXKFsqzZ+
	ocSNIDlw+ky6n9YXIAyJmUpx8FFvBL9DghNkFF8nDF6v31bs1+w=
X-Received: by 2002:a05:693c:62c1:b0:382:1c52:da74 with SMTP id 5a478bee46e88-3828101d214mr3570600eec.25.1795026929803;
        Wed, 18 Nov 2026 10:35:29 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:29 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless v2 0/4] wifi: nxpwifi: fix AP channel-switch lifetime and failures
Date: Thu, 19 Nov 2026 02:35:02 +0800
Message-ID: <20261118183506.45749-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Fix four problems in the nxpwifi AP channel-switch path: the delayed
work survives an AP stop, TX is stopped before the switch is prepared,
the work reads beacon data after the nl80211 request is freed, and a
failed switch leaves TX enabled over a stopped AP.

Changes in v2:
- Include v1 patch 1, which is not in wireless or nxpwifi-current yet
  and which patch 3 builds on. It now also clears uap_stop_tx when the
  AP stops.
- Patch 2: keep nxpwifi_queue_delayed_wiphy_work() instead of switching
  to wiphy_delayed_work_queue(). v1 patch 2 is the one with review
  comments; v1 patch 3 had none.
- Patch 3: minor style cleanup in nxpwifi_dup_csa_update().
- Patch 4: free the beacon update on every exit of the work, and clear
  uap_stop_tx when the switch fails.
- Shorten the changelogs and move the AI assistance note below "---".

v1: https://lore.kernel.org/r/20261028141819.7556-1-enderaoelyther@gmail.com

Zhao Li (4):
  wifi: nxpwifi: cancel channel switch work on teardown
  wifi: nxpwifi: stop AP TX after preparing channel switch
  wifi: nxpwifi: own beacon data used by channel switch work
  wifi: nxpwifi: stop AP when delayed channel switch fails

 drivers/net/wireless/nxp/nxpwifi/11h.c      | 23 +++++--
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 72 +++++++++++++++++++--
 drivers/net/wireless/nxp/nxpwifi/main.h     |  2 +-
 3 files changed, 83 insertions(+), 14 deletions(-)


base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
-- 
2.56.1

